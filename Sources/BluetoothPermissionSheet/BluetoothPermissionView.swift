import PermissionSheets
import SwiftUI

struct BluetoothPermissionPreview: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background(Image(systemName: "wave.3.right.circle.fill").resizable().scaledToFill())
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
        .askBluetoothPermission()
        .preferredColorScheme(.dark)
}

#Preview {
    Text("")
        .askBluetoothPermission(
            config: PermissionConfig(
                title: "Custom Bluetooth Title",
                description: "Custom Bluetooth description"
            )
        )
        .preferredColorScheme(.dark)
}

#endif
