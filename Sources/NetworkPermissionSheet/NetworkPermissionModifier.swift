import PermissionSheets
import SwiftUI

struct NetworkPermissionModifier: ViewModifier {
    @StateObject private var manager: LocationPermissionManager

    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: NetworkPermissionManager(config: config))
    }

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $manager.shouldShowSheet) {
                PermissionSheet(
                    title: manager.config.getTitle(for: .location),
                    description: manager.config.getDescription(for: .location),
                    content: {
                        LocationPreview()
                    },
                    primaryButtonTitle: "Enable Location",
                    primaryAction: {
                        manager.requestPermission()
                        manager.shouldShowSheet = false
                    },
                    onDismiss: {
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
        modifier(LocationPermissionModifier(config: config))
    }
}
