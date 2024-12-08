import SwiftUI
import CoreLocation
import PermissionSheets

public class LocationPermissionManager: NSObject, PermissionManaging, CLLocationManagerDelegate {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .location
    
    private let locationManager = CLLocationManager()
    
    public init(config: PermissionConfig) {
        self.config = config
        super.init()
        locationManager.delegate = self
        checkPermission()
    }
    
    public func checkPermission() {
        let status = locationManager.authorizationStatus
        let shouldShow = config.forceShow ||
            (status != .authorizedWhenInUse && status != .authorizedAlways &&
             config.displayFrequency.shouldDisplay(for: .location))
        
        shouldShowSheet = shouldShow
        if shouldShow {
            incrementCount()
        }
    }
    
    public func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
        updateLastPromptDate()
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission()
    }
}
