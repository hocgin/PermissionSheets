import PermissionSheets
import SwiftUI

public struct PhotoPreview: View {
    public init() {}

    public var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background(Image("photos", bundle: .module).resizable().scaledToFill())
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
        .askPhotoPermission()
        .preferredColorScheme(.dark)
}

#Preview {
    Text("")
        .askPhotoPermission(
            config: PermissionConfig(
                title: "Custom Photo Title",
                description: "Custom photo description"
            )
        )
        .preferredColorScheme(.dark)
}

#endif 