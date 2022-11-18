import UIKit
import CoreData

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
    
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    let context: NSManagedObjectContext = {
        return (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        view.addSubviews([citiesTableView, backButton])
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
        setupGestures()
        makeConstraints()
    }
    
    func setupGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func didSwipeLeft() {
        appDelegate.addCity(name: "Moscow", size: .big)
    }
    
    @objc func didSwipeRight() {
        //
    }
    
    @objc func didPressBackButton() {
        dismiss(animated: true)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            citiesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            citiesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            citiesTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            citiesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}
