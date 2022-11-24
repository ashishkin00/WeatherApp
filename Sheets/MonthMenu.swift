import UIKit

class MonthMenu: UIViewController {
    
    var delegate: GenericTableView?
    var cityname: String?
    var month: Months?
    
    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Temperature in C°"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 26)
        return textField
    }()
    
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didPressDoneButton))
        test()
        makeConstraints()
        
    }
    
    func test() {
        if let name = cityname, name.count > 0 {
            if let city = appDelegate.fetchCity(name: name) {
                if let m = month {
                    switch m {
                        case .january:
                            textField.text = "\(city.january)"
                        case .february:
                            textField.text = "\(city.february)"
                        case .march:
                            textField.text = "\(city.march)"
                        case .april:
                            textField.text = "\(city.april)"
                        case .may:
                            textField.text = "\(city.may)"
                        case .june:
                            textField.text = "\(city.june)"
                        case .july:
                            textField.text = "\(city.july)"
                        case .august:
                            textField.text = "\(city.august)"
                        case .september:
                            textField.text = "\(city.september)"
                        case .october:
                            textField.text = "\(city.october)"
                        case .november:
                            textField.text = "\(city.november)"
                        case .december:
                            textField.text = "\(city.december)"
                    }
                }
            }
        }
    }
    
    @objc private func didPressDoneButton() {
        if let name = cityname, name.count > 0 {
            if let value = Double(textField.text!) {
                print(name, month!, value)
                appDelegate.setTemperature(name: name, temp: value, month: month!)
                delegate?.reloadTableData()
                dismiss(animated: true)
            }
        } else {
            // throw error
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
