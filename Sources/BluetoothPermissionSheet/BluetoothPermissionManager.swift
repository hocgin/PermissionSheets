import CoreBluetooth
import PermissionSheets
import SwiftUI

public class BluetoothPermissionManager: NSObject, PermissionManaging, CBCentralManagerDelegate {
    @Published public var shouldShowSheet = false
    public let config: PermissionConfig
    public let permissionType: PermissionType = .bluetooth
    private var completion: (CBManagerState) -> Void = { _ in }
    private var centralManager: CBCentralManager = .init()

    public init(config: PermissionConfig) {
        self.config = config
        super.init()
        centralManager.delegate = self
        checkPermission()
    }

    public func checkPermission() {
        let status = centralManager.state
        let shouldShow = config.forceShow ||
            (status != .poweredOn &&
                config.displayFrequency.shouldDisplay(for: .bluetooth))

        shouldShowSheet = shouldShow
    }

    public func requestPermission(completion: @escaping (CBManagerState) -> Void = { _ in }) {
        self.completion = completion
        let status = centralManager.state
        if [.poweredOn].contains(where: { $0 == status }) {
            completion(status)
        } else {
            openAppSettings()
        }

        updateLastPromptDate()
    }

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        checkPermission()
        completion(central.state)
    }

    public func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                
            })
        }
    }
}
