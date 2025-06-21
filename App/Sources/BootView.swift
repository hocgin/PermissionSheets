//
//  ContentView.swift
//  iOS Example
//
//  Created by __AUTHOR NAME__ on __TODAYS_DATE__.
//

import LocationPermissionSheet
import NetworkPermissionSheet
import SwiftUI

struct BootView: View {
    var body: some View {
        Text("Hi")
//            .askLocationPermission()
            .askNetworkPermission()
    }
}
