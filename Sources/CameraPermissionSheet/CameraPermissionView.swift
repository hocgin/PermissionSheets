import PermissionSheets
import SwiftUI

struct CameraPermissionPreview: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background(Image(systemName: "camera.fill").resizable().scaledToFill())
        .background(.ultraThinMaterial)
        .cornerRadius(42, corners: [.topLeft, .topRight])
        .padding([.horizontal, .top], 24)
        .padding(.top)
        .background(.black.opacity(0.5))
    }
}

#if DEBUG
#Preview {
    Text("")
        .preferredColorScheme(.dark)
        .askCameraPermission()
}

#Preview {
    Text("")
        .askCameraPermission(
            config: PermissionConfig(
                title: "Custom Camera Title",
                description: "Custom Camera description"
            )
        )
        .preferredColorScheme(.dark)
}

#endif
