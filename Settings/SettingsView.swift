import UIKit

extension SettingsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(addCityButton)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        makeConstraints()
        setupGestures()
    }
}
