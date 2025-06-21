//
//  ContentView.swift
//  iOS Example
//
//  Created by __AUTHOR NAME__ on __TODAYS_DATE__.
//

import BluetoothPermissionSheet
import CameraPermissionSheet
import LocationPermissionSheet
import NetworkPermissionSheet
import PhotoPermissionSheet
import SwiftUI

struct BootView: View {
    var body: some View {
        Text("Hi")
            .askPhotoPermission()
//            .askCameraPermission()
//            .askBluetoothPermission()
//            .askLocationPermission()
//            .askNetworkPermission()
    }
}
