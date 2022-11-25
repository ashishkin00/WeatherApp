import UIKit

class HomeScreen: UIViewController {
    let summerTemp: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "?"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winterTemp: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "?"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fallTemp: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "?"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let autumnTemp: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "?"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let citySize: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "size"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winterText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Winter"
        return label
    }()
    
    let autumnText: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Autumn"
        return label
    }()
    
    let summerText: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Summer"
        return label
    }()
    
    let fallText: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fall"
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        picker.contentMode = .center
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let splashLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Nothing to display")
        label.isHidden = true
        label.textColor = .label.withAlphaComponent(0.25)
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    var cities: [[String]] = [[], []]
    var strategy: TemperatureStrategy = CelsiusStrategy()
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
}
