import PermissionSheets
import SwiftUI

struct NetworkPermissionModifier: ViewModifier {
    @StateObject private var manager: NetworkPermissionManager

    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: NetworkPermissionManager(config: config))
    }

    func body(content: Content) -> some View {
        content.sheet(isPresented: $manager.shouldShowSheet) {
            PermissionSheet(
                title: manager.config.getTitle(for: .network),
                description: manager.config.getDescription(for: .network),
                content: { NetworkPreview() },
                primaryButtonTitle: "Enable Network",
                primaryAction: {
                    manager.requestPermission()
                },
                onDismiss: {
                    manager.stopMonitoring()
                    manager.shouldShowSheet = false
                }
            )
        }
    }
}

public extension View {
    func askNetworkPermission(
        config: PermissionConfig = .init()
    ) -> some View {
        modifier(NetworkPermissionModifier(config: config))
    }
}
