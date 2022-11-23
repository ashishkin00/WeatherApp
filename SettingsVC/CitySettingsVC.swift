import UIKit

extension CitySettings {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)

        view.addSubview(removeButton)
        removeButton.addTarget(self, action: #selector(didPressRemoveButton), for: .touchUpInside)
        
        view.addSubview(cityName)
        view.addSubview(editbutton)
        editbutton.addTarget(self, action: #selector(didPressEditButton), for: .touchUpInside)
        
        makeConstraints()
    }
    
    @objc func didSwipeRight() {
        dispose()
    }
    
    @objc func didPressBackButton() {
        dispose()
    }
    
    @objc func didPressEditButton() {
        let menu = SomeMenu()
        menu.delegate = self
        menu.cityname = cityName.text
        let nav = UINavigationController(rootViewController: menu)
        nav.modalPresentationStyle = .formSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
            present(nav, animated: true)
        }
    }
    
    @objc func didPressRemoveButton() {
        if let name = cityName.text, name.count > 0 {
            if appDelegate.removeCity(name: name) {
                print("deleted")
                delegate?.reloadTableData()
                dispose()
            } else {
                print("error")
            }
        }
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
