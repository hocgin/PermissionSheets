import Foundation

public enum PermissionType: String, Identifiable {
    case notification
    case location
    case camera
    case photos
    case network
    
    var lastPromptKey: String {
        "lastPromptDate.\(self.rawValue)"
    }
}
