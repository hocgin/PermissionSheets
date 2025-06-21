import PermissionSheets
import SwiftUI

struct CameraPermissionModifier: ViewModifier {
    @StateObject private var manager: CameraPermissionManager

    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: CameraPermissionManager(config: config))
    }

    func body(content: Content) -> some View {
        content.sheet(isPresented: $manager.shouldShowSheet) {
            PermissionSheet(
                title: manager.config.getTitle(for: .location),
                description: manager.config.getDescription(for: .location),
                content: {
                    CameraPermissionPreview()
                },
                primaryButtonTitle: "Enable Camera",
                primaryAction: {
                    manager.requestPermission { _ in }
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
    func askCameraPermission(
        config: PermissionConfig = .init(
            title: "Camera Access",
            description: "This app needs camera access to take photos."
        )
    ) -> some View {
        modifier(CameraPermissionModifier(config: config))
    }
}
