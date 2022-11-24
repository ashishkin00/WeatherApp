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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        makeConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(splashLabel)
    }
    
    func hideSplash(_ state: Bool) {
        splashLabel.isHidden = state
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
