import UIKit

extension CitiesList {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(didPressAddButton), for: .touchUpInside)
        
        view.addSubview(splashLabel)
        
        makeConstraints()
    }
    
    @objc func didSwipeRight() {
        dispose()
    }
    
    func hideSplash(_ state: Bool) {
        splashLabel.isHidden = state
    }
    
    @objc func didPressBackButton() {
        dispose()
    }
    
    @objc func didPressAddButton() {
        let addMenu = AddMenuVC()
        addMenu.delegate = self
        let nav = UINavigationController(rootViewController: addMenu)
        nav.modalPresentationStyle = .formSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
            present(nav, animated: true)
        }
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
