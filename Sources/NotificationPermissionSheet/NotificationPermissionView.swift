import PermissionSheets
import SwiftUI

public struct NotificationPreview: View {
    @State private var animating = false

    public init() {}

    public var body: some View {
        VStack {
            Spacer()
            timeView
            Spacer()
            notificationView
                .offset(y: animating ? 0 : 32)
                .opacity(animating ? 1 : 0)
            Spacer()
        }
        .hSpacing(.center)
        .padding(12)
        .background(.ultraThinMaterial)
        .cornerRadius(42, corners: [.topLeft, .topRight])
        .padding([.horizontal, .top], 24)
        .padding(.top)
        .background(.black.opacity(0.5))
        .animation(.easeInOut.delay(0.5), value: animating)
        .onAppear {
            animating.toggle()
        }
    }

    private var timeView: some View {
        Text("9:41")
            .font(.system(size: 84))
            .foregroundStyle(.secondary)
    }

    private var notificationView: some View {
        HStack {
            Image(systemName: "bell.badge.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 28)
                .foregroundStyle(.red.gradient)

            notificationContent
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .clipRadius(18)
        .shadow(
            color: .black.opacity(0.125),
            radius: 12,
            y: 12
        )
    }

    private var notificationContent: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 128, height: 16)
            RoundedRectangle(cornerRadius: 6)
                .frame(height: 8)
            RoundedRectangle(cornerRadius: 6)
                .frame(height: 8)
        }
        .foregroundStyle(.secondary)
        .padding(.trailing)
    }
}

#if DEBUG
#Preview("NotificationPreview") {
    NotificationPreview()
}

#Preview {
    Text("")
        .askNotificationPermission()
        .preferredColorScheme(.dark)
}

#Preview {
    Text("")
        .askNotificationPermission(
            config: PermissionConfig(
                title: "Custom Notification Title",
                description: "Custom notification description"
            )
        )
}
#endif
