import SwiftUI

public protocol PermissionManaging: ObservableObject {
    var shouldShowSheet: Bool { get set }
    var config: PermissionConfig { get }
    var permissionType: PermissionType { get }
    
    func checkPermission()
    func updateLastPromptDate()
}

public extension PermissionManaging {
    func updateLastPromptDate() {
        UserDefaults.standard.set(Date(), forKey: permissionType.lastPromptKey)
    }
    
    func incrementCount() {
        let currentCount = UserDefaults.standard.integer(forKey: permissionType.countKey)
        UserDefaults.standard.set(currentCount + 1, forKey: permissionType.countKey)
    }
}
