@objc enum CitySizes: Int {
    case big, medium, small
    var toString: String {
        switch self {
            case .big:
                return "Big"
            case .medium:
                return "Medium"
            case .small:
                return "Small"
        }
    }
}
