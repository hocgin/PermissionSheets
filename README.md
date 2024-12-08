# PermissionSheets

A SwiftUI package for elegant, customizable permission request sheets with animated previews for notifications and location services.

￼<img src="https://github.com/user-attachments/assets/9f42bb50-45ea-4792-8635-f3aeabbf4dd1" width="360"> <img src="https://github.com/user-attachments/assets/16a6f5aa-c166-4030-a089-2959d24e927a" width="360">


![Swift 5.5+](https://img.shields.io/badge/Swift-5.5%2B-orange)
![iOS 16+](https://img.shields.io/badge/iOS-15.0%2B-blue)
![SwiftUI 3+](https://img.shields.io/badge/SwiftUI-3.0%2B-red)

## Features

- 🎨 Beautiful pre-built permission request sheets
- 🔔 Support for Notification and Location permissions
- ✨ Animated native-looking preview screens
- 🎯 Customizable titles and descriptions
- ⚡️ Simple ViewModifier-based implementation
- 📱 iOS-style design that matches system UI
- 🔄 Configurable display frequency (immediate, once, etc.)

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/PermissionSheets.git", from: "1.0.0")
]
```

Or add it directly in Xcode:
1. Go to File > Add Packages
2. Paste the repository URL
3. Click Add Package

## Quick Start

### Notification Permission

```swift
import SwiftUI
import PermissionSheets

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .askNotificationPermission()
    }
}
```

### Location Permission

```swift
import SwiftUI
import PermissionSheets

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .askLocationPermission()
    }
}
```

## Customization

### Custom Titles and Descriptions

```swift
Text("Hello, World!")
    .askNotificationPermission(
        config: PermissionConfig(
            title: "Stay Updated!",
            description: "Enable notifications to never miss important updates"
        )
    )
```

### Display Frequency

Control how often the permission sheet appears:

```swift
Text("Hello, World!")
    .askLocationPermission(
        config: PermissionConfig(
            displayFrequency: .once,
            title: "Location Access",
            description: "We need your location to show nearby places"
        )
    )
```

Available display frequencies:
- `.immediate`: Shows every time
- `.once`: Shows only once
- `.daily`: Shows once per day
- `.weekly`: Shows once per week

### Force Display

Force the permission sheet to show regardless of previous user interaction:

```swift
Text("Hello, World!")
    .askNotificationPermission(
        config: PermissionConfig(forceShow: true)
    )
```

## Requirements

- iOS 16.0+
- Swift 5.5+
- SwiftUI 3.0+

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by native iOS permission requests
- Built with SwiftUI
- Created with ❤️

## Author

[Aayush Pokharel]
- Twitter: [@aayushbuilds](https://twitter.com/aayushbuilds)
- GitHub: [@Aayush9029](https://github.com/Aayush9029)
