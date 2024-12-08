import Foundation

public enum PermissionType: String {
    case notification
    case location
    case camera
    case photos
    
    var lastPromptKey: String {
        "lastPromptDate.\(self.rawValue)"
    }
    
    var countKey: String {
        "appOpenCount.\(self.rawValue)"
    }
}
