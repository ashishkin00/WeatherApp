import UIKit

class SomeMenu: UIViewController {

    var cityname: String?
    
    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "New name"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 46)
        return textField
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    convenience init(name: String?) {
        self.init()
        cityname = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.addSubview(doneButton)
        view.backgroundColor = .systemBackground
        doneButton.addTarget(self, action: #selector(didPressDoneButton), for: .touchUpInside)
        makeConstraints()
    }
    
    @objc private func didPressDoneButton() {
        if let city = appDelegate.fetchCity(name: cityname) {
            city.name = textField.text
            dispose()
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            textField.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
