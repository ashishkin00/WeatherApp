import UIKit
import CoreData

extension UIViewController {
    func dispose() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: .linear)
        transition.type = .reveal
        transition.subtype = .fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    func show(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: .linear)
        transition.type = .moveIn
        transition.subtype = .fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.present(vc, animated: false)
    }
}

class CitiesList: UIViewController {
    let citiesTableView: UITableView = {
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
    
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    let context: NSManagedObjectContext = {
        return (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(citiesTableView)
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(didPressAddButton), for: .touchUpInside)
        
        view.addSubview(splashLabel)
        
        makeConstraints()
    }
    
    @objc func didPressBackButton() {
        dispose()
    }
    
    @objc func didPressAddButton() {
        let addMenu = AddMenuVC()
        //        addMenu.modalPresentationStyle = .pageSheet
        //        self.present(addMenu, animated: true)
        let nav = UINavigationController(rootViewController: addMenu)
        nav.modalPresentationStyle = .formSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(nav, animated: true, completion: nil)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            citiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            citiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            citiesTableView.topAnchor.constraint(equalTo: addButton.bottomAnchor),
            citiesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
