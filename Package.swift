// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "PermissionSheets",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Core library with shared protocols and utilities
        .library(
            name: "PermissionSheets",
            targets: ["PermissionSheets"]
        ),
        
        // Individual permission libraries
        .library(
            name: "NotificationPermissionSheet",
            targets: ["NotificationPermissionSheet"]
        ),
        .library(
            name: "LocationPermissionSheet",
            targets: ["LocationPermissionSheet"]
        ),
        .library(
            name: "NetworkPermissionSheet",
            targets: ["NetworkPermissionSheet"]
        ),
        .library(
            name: "BluetoothPermissionSheet",
            targets: ["BluetoothPermissionSheet"]
        ),
        .library(
            name: "CameraPermissionSheet",
            targets: ["CameraPermissionSheet"]
        ),
        .library(
            name: "PhotoPermissionSheet",
            targets: ["PhotoPermissionSheet"]
        )
    ],
    dependencies: [],
    targets: [
        // Core target containing shared code
        .target(
            name: "PermissionSheets",
            dependencies: []
        ),
        
        // Notification permission library
        .target(
            name: "NotificationPermissionSheet",
            dependencies: ["PermissionSheets"]
        ),
        
        // Location permission library
        .target(
            name: "LocationPermissionSheet",
            dependencies: ["PermissionSheets"]
        ),
        .target(
            name: "NetworkPermissionSheet",
            dependencies: ["PermissionSheets"]
        ),
        .target(
            name: "BluetoothPermissionSheet",
            dependencies: ["PermissionSheets"]
        ),
        .target(
            name: "CameraPermissionSheet",
            dependencies: ["PermissionSheets"]
        ),
        .target(
            name: "PhotoPermissionSheet",
            dependencies: ["PermissionSheets"]
        )
    ]
)
