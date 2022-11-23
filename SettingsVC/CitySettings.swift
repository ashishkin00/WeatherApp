import UIKit

class CitySettings: UIViewController, GenericTableView {
    let cityName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Placeholder"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let editbutton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray.withAlphaComponent(0.5)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    let removeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Remove", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.red.withAlphaComponent(0.5), for: .highlighted)
        return button
    }()
    
    var selectedIndex: Int?
    var tableView: UITableView = .init()
    var delegate: GenericTableView?
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
}
