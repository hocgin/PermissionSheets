import SwiftUI
import PermissionSheets

struct LocationPreview: View {
    var body: some View {
        VStack {
            Spacer()
            timeView
            Spacer()
            Spacer()
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background( Image("applemaps", bundle: .module).resizable().scaledToFill())
        .background(.ultraThinMaterial)
        .cornerRadius(42, corners: [.topLeft, .topRight])
        .padding([.horizontal, .top], 24)
        .padding(.top)
        .background(.black.opacity(0.5))
    }
    
    private var timeView: some View {
        Text("9:41")
            .font(.system(size: 84))
            .foregroundStyle(.secondary)
    }
}




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


