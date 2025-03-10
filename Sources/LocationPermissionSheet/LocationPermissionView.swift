import PermissionSheets
import SwiftUI

public struct LocationPreview: View {
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
        .background(Image("applemaps", bundle: .module).resizable().scaledToFill())
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
        .askLocationPermission()
        .preferredColorScheme(.dark)
}

#Preview {
    Text("")
        .askLocationPermission(
            config: PermissionConfig(
                title: "Custom Location Title",
                description: "Custom location description"
            )
        )
        .preferredColorScheme(.dark)
}

#endif
