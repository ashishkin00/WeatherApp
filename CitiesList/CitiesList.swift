import UIKit
import CoreData

class CitiesList: UIViewController, GenericTableView {
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Add", for: .normal)
        return button
    }()
    
    let splashLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Empty"
        label.isHidden = true
        label.textColor = .label.withAlphaComponent(0.25)
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    var delegate: GenericTableView?
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
}
