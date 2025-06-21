import PermissionSheets
import SwiftUI

public struct NetworkPreview: View {
    public init() {}

    public var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("请求网络权限")
            Spacer()
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background(.ultraThinMaterial)
        .cornerRadius(42, corners: [.topLeft, .topRight])
        .padding([.horizontal, .top], 24)
        .padding(.top)
        .background(.black.opacity(0.5))
    }
}

#if DEBUG

#Preview {
    NetworkPreview()
}

#Preview {
    Text("")
        .askNetworkPermission()
        .preferredColorScheme(.dark)
}

#Preview {
    Text("")
        .askNetworkPermission(
            config: PermissionConfig(
                title: "Custom Location Title",
                description: "Custom location description"
            )
        )
        .preferredColorScheme(.dark)
}

#endif
