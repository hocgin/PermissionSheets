import CoreLocation
import PermissionSheets
import SwiftUI

public class LocationPermissionManager: NSObject, PermissionManaging, CLLocationManagerDelegate {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .location
    
    private let locationManager = CLLocationManager()
    private var completion: (CLAuthorizationStatus) -> Void = { _ in }

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
    }
    
    public func requestPermission(completion: @escaping (CLAuthorizationStatus) -> Void = { _ in }) {
        self.completion = completion
        locationManager.requestWhenInUseAuthorization()
        updateLastPromptDate()
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission()
    }
    
    func locationManagerDidChangeAuthorization(locationManager: CLLocationManager) {
        completion(locationManager.authorizationStatus)
    }
}
