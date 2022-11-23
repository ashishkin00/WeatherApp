import UIKit

class CitySelector: UIViewController, GenericTableView {
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
    var delegate2: HomeScreen?
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
}
