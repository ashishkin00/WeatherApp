import UIKit

class CitySettings: UIViewController, GenericTableView {
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        setupSubviews()
        makeConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(removeButton)
        view.addSubview(cityName)
        view.addSubview(editbutton)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            removeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            removeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            cityName.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            cityName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cityName.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.5),
            
            editbutton.centerYAnchor.constraint(equalTo: cityName.centerYAnchor),
            editbutton.trailingAnchor.constraint(equalTo: cityName.leadingAnchor, constant: -5),
        ])
    }
}
