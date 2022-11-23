import UIKit

class AddMenuVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: GenericTableView?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row].toString
    }
    
    let doneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "City name"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 46)
        return textField
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let pickerData = CitySizes.allCases
    var selectedRow: Int = 0
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(picker)
        picker.delegate = self
        picker.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didPressDoneButton))
        makeConstraints()
    }
    
    @objc private func didPressDoneButton() {
        if let name = textField.text, name.count > 0 {
            appDelegate.addCity(name: name, size: CitySizes.allCases[picker.selectedRow(inComponent: 0)])
            delegate?.reloadTableData()
            dismiss(animated: true)
        } else {
            // throw error
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
