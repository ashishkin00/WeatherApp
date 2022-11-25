import UIKit

class AddMenuVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    let backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    let pickerData = CitySizes.allCases
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        picker.delegate = self
        picker.dataSource = self
        setupSubviews()
        setupActions()
        makeConstraints()
    }
    
    private func setupActions() {
        doneButton.addTarget(self, action: #selector(didPressDoneButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
        view.addSubview(doneButton)
        view.addSubview(backButton)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(picker)
    }
    
    @objc private func didPressBackButton() {
        dismiss(animated: true)
    }
    
    @objc private func didPressDoneButton() {
        if let name = textField.text, name.count > 0 {
            appDelegate.addCity(name: name, size: CitySizes.allCases[picker.selectedRow(inComponent: 0)])
            dismiss(animated: true)
        } else {
            print("count <= 0 or nil")
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
