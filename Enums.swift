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

enum Months: String, CaseIterable {
    case january = "January"
    case february = "February"
    case march = "March"
    case april = "April"
    case may = "May"
    case june = "June"
    case july = "July"
    case august = "August"
    case september = "September"
    case october = "October"
    case november = "November"
    case december = "December"
    
    
}
