import SwiftUI
import UserNotifications
import PermissionSheets

public class NotificationPermissionManager: PermissionManaging {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .notification
    
    public init(config: PermissionConfig) {
        self.config = config
        checkPermission()
    }
    
    public func checkPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            guard let self else { return }
            DispatchQueue.main.async {
                let shouldShow = self.config.forceShow ||
                    (settings.authorizationStatus != .authorized &&
                     self.config.displayFrequency.shouldDisplay(for: .notification))
                self.shouldShowSheet = shouldShow
            }
        }
    }
    
    public func requestPermission(completion: @escaping () -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            DispatchQueue.main.async {
                self.updateLastPromptDate()
                completion()
            }
        }
    }
}
