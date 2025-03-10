//
//  SwiftUIView.swift
//  PermissionSheets
//
//  Created by hocgin on 2025/3/10.
//

import SwiftUI

public struct NetworkPermissionManager: PermissionManaging {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .network

    public init(config: PermissionConfig) {
        self.config = config
        checkPermission()
    }

    public func checkPermission() {
        switch CTCellularData().cellularDataRestrictionDidUpdateNotifier {
            // 允许无线局域网与蜂窝数据时
            case .notRestricted:
                shouldShowSheet = false
            // 仅允许无线局域网时、权限关闭时
            case .restricted:
                shouldShowSheet = false
            // 受限状态未知的
            case .restrictedStateUnknown: fallthrough
            default:
                shouldShowSheet = true
        }
    }

    public func requestPermission() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
