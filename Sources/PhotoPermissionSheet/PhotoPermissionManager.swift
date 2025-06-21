import PermissionSheets
import Photos
import SwiftUI

public class PhotoPermissionManager: PermissionManaging {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .photos
    
    public init(config: PermissionConfig) {
        self.config = config
        checkPermission()
    }
    
    public func checkPermission() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        let shouldShow = config.forceShow ||
            (status != .authorized && status != .limited &&
                config.displayFrequency.shouldDisplay(for: .photos))
        
        shouldShowSheet = shouldShow
    }
    
    public func requestPermission(completion: @escaping (PHAuthorizationStatus) -> Void = { _ in }) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                if status == .authorized || status == .limited {
                    self.checkPermission()
                    completion(status)
                } else {
                    self.openAppSettings()
                }
            }
        }
        updateLastPromptDate()
    }
    
    public func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                self.checkPermission()
            })
        }
    }
}
