@objc enum CitySizes: Int, CaseIterable {
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
