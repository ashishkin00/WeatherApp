import UIKit

extension HomeScreen: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateValues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupGestures()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateValues()
        hideUIifNeeded()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentCitiesList))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func presentCitiesList() {
        present(CitiesList())
    }
    
    private func updateValues() {
        cities[1] = ["F", "C", "K"]
        cities[0] = appDelegate.fetchAllNames(ascending: true)
        picker.reloadAllComponents()
        switch cities[1][picker.selectedRow(inComponent: 1)] {
            case "F":
                strategy = FahrenheitStrategy()
                break
            case "C":
                strategy = CelsiusStrategy()
                break
            case "K":
                strategy = KelvinStrategy()
                break
            default:
                break
        }
        if let city = appDelegate.fetchCity(name: cities[0][safe: picker.selectedRow(inComponent: 0)] ?? "") {
            city.avg_temp_winter = [city.december, city.january, city.february].avg()
            city.avg_temp_autumn = [city.march, city.april, city.may].avg()
            city.avg_temp_summer = [city.june, city.july, city.august].avg()
            city.avg_temp_fall = [city.september, city.october, city.november].avg()
            appDelegate.saveContext()
            self.citySize.text = city.size
            let mf = MeasurementFormatter()
            mf.numberFormatter.maximumFractionDigits = 1
            mf.unitOptions = .providedUnit
            autumnTemp.text =  mf.string(from: Temperature(strategy: strategy).getValue(city.avg_temp_autumn))
            summerTemp.text = mf.string(from: Temperature(strategy: strategy).getValue(city.avg_temp_summer))
            winterTemp.text = mf.string(from: Temperature(strategy: strategy).getValue(city.avg_temp_winter))
            fallTemp.text = mf.string(from: Temperature(strategy: strategy).getValue(city.avg_temp_fall))
        }
    }
    
    private func hideUIifNeeded() {
        if cities[0].count > 0 {
            splashLabel.isHidden = true
            stackView.isHidden = false
            picker.isHidden = false
            citySize.isHidden = false
            winterText.isHidden = false
            summerText.isHidden = false
            fallText.isHidden = false
            autumnText.isHidden = false
        } else {
            splashLabel.isHidden = false
            stackView.isHidden = true
            picker.isHidden = true
            citySize.isHidden = true
            winterText.isHidden = true
            summerText.isHidden = true
            fallText.isHidden = true
            autumnText.isHidden = true
        }
    }
    
    private func setupSubviews() {
        view.addSubview(splashLabel)
        view.addSubview(citySize)
        view.addSubview(picker)
        picker.delegate = self
        picker.dataSource = self
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(winterTemp)
        stackView.addArrangedSubview(autumnTemp)
        stackView.addArrangedSubview(summerTemp)
        stackView.addArrangedSubview(fallTemp)
        
        view.addSubview(winterText)
        winterText.centerXAnchor.constraint(equalTo: winterTemp.centerXAnchor).isActive = true
        winterText.topAnchor.constraint(equalTo: winterTemp.bottomAnchor).isActive = true
        
        view.addSubview(autumnText)
        autumnText.centerXAnchor.constraint(equalTo: autumnTemp.centerXAnchor).isActive = true
        autumnText.topAnchor.constraint(equalTo: autumnTemp.bottomAnchor).isActive = true
        
        view.addSubview(summerText)
        summerText.centerXAnchor.constraint(equalTo: summerTemp.centerXAnchor).isActive = true
        summerText.topAnchor.constraint(equalTo: summerTemp.bottomAnchor).isActive = true
        
        view.addSubview(fallText)
        fallText.centerXAnchor.constraint(equalTo: fallTemp.centerXAnchor).isActive = true
        fallText.topAnchor.constraint(equalTo: fallTemp.bottomAnchor).isActive = true
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            citySize.centerXAnchor.constraint(equalTo: picker.centerXAnchor),
            citySize.bottomAnchor.constraint(equalTo: picker.topAnchor),
            
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.topAnchor.constraint(greaterThanOrEqualTo: citySize.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
}
