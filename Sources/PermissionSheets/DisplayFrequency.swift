import Foundation

public enum DisplayFrequency: Equatable {
    case immediate
    case weekly
    case monthly
    
    private var timeInterval: TimeInterval? {
        switch self {
        case .immediate:
            return nil
        case .weekly:
            return 7 * 24 * 60 * 60
        case .monthly:
            return 30 * 24 * 60 * 60
        }
    }

    public func shouldDisplay(for type: PermissionType) -> Bool {
        switch self {
        case .immediate:
            return true
            
        case .weekly, .monthly:
            guard let lastPrompt = UserDefaults.standard.object(forKey: type.lastPromptKey) as? Date,
                  let interval = timeInterval else {
                return true
            }
            return Date().timeIntervalSince(lastPrompt) >= interval
        }
    }
}
