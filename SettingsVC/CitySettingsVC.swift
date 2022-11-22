import UIKit

class CitySettingsVC: UIViewController {
    let monthsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
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
    
    var selectedIndex: Int?
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(monthsTableView)
        monthsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        monthsTableView.delegate = self
        monthsTableView.dataSource = self
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)

        view.addSubview(removeButton)
        removeButton.addTarget(self, action: #selector(didPressRemoveButton), for: .touchUpInside)
        
        view.addSubview(cityName)
        view.addSubview(editbutton)
        
        makeConstraints()
    }
    
    @objc func didPressBackButton() {
        dispose()
    }
    
    @objc func didPressRemoveButton() {
        if let name = cityName.text, name.count > 0 {
            if appDelegate.removeCity(name: name) {
                print("deleted")
                dispose()
            } else {
                print("error")
            }
        }
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            monthsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthsTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            monthsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
