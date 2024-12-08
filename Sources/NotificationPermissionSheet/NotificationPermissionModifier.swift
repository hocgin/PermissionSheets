import PermissionSheets
import SwiftUI

struct NotificationPermissionModifier: ViewModifier {
    @StateObject private var manager: NotificationPermissionManager
    
    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: NotificationPermissionManager(config: config))
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $manager.shouldShowSheet) {
                PermissionSheet(
                    title: manager.config.getTitle(for: .notification),
                    description: manager.config.getDescription(for: .notification),
                    content: {
                        NotificationPreview()
                    },
                    primaryButtonTitle: "Enable Notifications",
                    primaryAction: { manager.requestPermission { manager.shouldShowSheet = false } },
                    onDismiss: { manager.shouldShowSheet = false }
                )
            }
    }
}

public extension View {
    func askNotificationPermission(
        config: PermissionConfig = .init()
    ) -> some View {
        modifier(NotificationPermissionModifier(config: config))
    }
}
