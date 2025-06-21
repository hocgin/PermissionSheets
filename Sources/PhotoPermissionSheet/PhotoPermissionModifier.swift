import PermissionSheets
import SwiftUI

struct PhotoPermissionModifier: ViewModifier {
    @StateObject private var manager: PhotoPermissionManager

    init(config: PermissionConfig) {
        _manager = StateObject(wrappedValue: PhotoPermissionManager(config: config))
    }

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $manager.shouldShowSheet) {
                PermissionSheet(
                    title: manager.config.getTitle(for: .photos),
                    description: manager.config.getDescription(for: .photos),
                    content: {
                        PhotoPreview()
                    },
                    primaryButtonTitle: "Enable Photos",
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
    func askPhotoPermission(
        config: PermissionConfig = .init()
    ) -> some View {
        modifier(PhotoPermissionModifier(config: config))
    }
}
