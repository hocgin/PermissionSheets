import PermissionSheets
import SwiftUI

struct BluetoothPermissionModifier: ViewModifier {
    @StateObject private var manager: BluetoothPermissionManager

    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: BluetoothPermissionManager(config: config))
    }

    func body(content: Content) -> some View {
        content.sheet(isPresented: $manager.shouldShowSheet) {
            PermissionSheet(
                title: manager.config.getTitle(for: .location),
                description: manager.config.getDescription(for: .location),
                content: {
                    BluetoothPermissionPreview()
                },
                primaryButtonTitle: "Enable Bluetooth",
                primaryAction: {
                    manager.requestPermission { state in
                        manager.shouldShowSheet = state == .poweredOn
                    }
                },
                onDismiss: {
                    manager.shouldShowSheet = false
                }
            )
        }
        .onAppear {
            manager.checkPermission()
        }
    }
}

public extension View {
    func askBluetoothPermission(
        config: PermissionConfig = .init(
            title: "Bluetooth Access",
            description: "This app needs Bluetooth to connect to nearby devices."
        )
    ) -> some View {
        modifier(BluetoothPermissionModifier(config: config))
    }
}
