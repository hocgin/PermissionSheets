//
//  SwiftUIView.swift
//  PermissionSheets
//
//  Created by hocgin on 2025/3/10.
//

import CoreTelephony
import Network
import PermissionSheets
import SwiftUI

public class NetworkPermissionManager: PermissionManaging {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .network
    private let queue = DispatchQueue(label: "Monitor")
    private let monitor = NWPathMonitor()
    private var completion: (Bool) -> Void = { _ in }

    public init(config: PermissionConfig) {
        self.config = config
        checkPermission()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                let isConnected = (path.status == .satisfied)
                debugPrint("isConnected = \(isConnected), path.status = \(path.status)")
                self.shouldShowSheet = !isConnected
                self.completion(isConnected)
            }
        }
    }

    public func checkPermission() {
        let shouldShow = config.forceShow
        if shouldShow {
            shouldShowSheet = true
        }
        else {
            authorizationPermission { _ in }
        }
    }

    public func authorizationPermission(completion: @escaping (Bool) -> Void) {
        self.completion = completion
        monitor.start(queue: queue)
    }

    public func stopMonitoring() {
        monitor.cancel()
    }

//    private func requestPermission(completion: @escaping (Bool) -> Void) {
//        cellularData.cellularDataRestrictionDidUpdateNotifier = { state in
//            switch state {
//            case .notRestricted:
//                print("无限制（允许无线局域网与蜂窝数据时）")
//                return completion(true)
//            case .restricted:
//                print("受限的（仅限无线网络时、不允许时）")
//                return completion(true)
//            case .restrictedStateUnknown:
//                print("受限状态未知的")
//                return completion(false)
//            default:
//                print("受限状态未知的 default ")
//                return completion(false)
//            }
//        }
//    }
//
//    private func isNetworkPermissions() -> Bool {
//        var isNetworkPermissions = false
//        let cellularData = CTCellularData()
//        /// 线程信号量
//        let semaphore = DispatchSemaphore(value: 0)
//
//        cellularData.cellularDataRestrictionDidUpdateNotifier = { state in
//            if state == .notRestricted {
//                isNetworkPermissions = true
//
//            } else {
//                isNetworkPermissions = false
//            }
//
//            semaphore.signal()
//        }
//
//        semaphore.wait(timeout: .now())
//        return isNetworkPermissions
//    }

    public func requestPermission(completion: @escaping (Bool) -> Void = { _ in }) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                self.authorizationPermission(completion: completion)
            })
        }
    }
}
