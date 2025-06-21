import AVFoundation
import PermissionSheets
import SwiftUI

public class CameraPermissionManager: PermissionManaging {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .camera

    public init(config: PermissionConfig) {
        self.config = config
        checkPermission()
    }

    public func checkPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        let isAuthorized = (status == .authorized)
        shouldShowSheet = config.forceShow ||
            (!isAuthorized && config.displayFrequency.shouldDisplay(for: .camera))
    }

    public func requestPermission(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                self.shouldShowSheet = !granted
                if granted {
                    completion(granted)
                } else {
                    self.openAppSettings()
                }
            }
        }
    }

    public func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
