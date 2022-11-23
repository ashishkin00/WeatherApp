import UIKit

class SomeMenu: UIViewController {
    
    var delegate: CitySettings?
    var cityname: String?
    
    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "New name"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 46)
        return textField
    }()
    
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didPressDoneButton))
        makeConstraints()
    }
    
    @objc private func didPressDoneButton() {
        if let name = cityname, let city = appDelegate.fetchCity(name: name) {
            city.name = self.textField.text
            appDelegate.saveContext()
            delegate?.cityName.text = self.textField.text
            dismiss(animated: true)
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
