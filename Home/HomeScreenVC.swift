import UIKit

extension HomeScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.distribution = .equalSpacing
        setupSubviews()
        makeConstraints()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateValues()
    }
    
    func updateValues() {
        if let name = cityName, let city = appDelegate.fetchCity(name: name) {
            hideSplash(true)
            city.avg_temp_winter = ([city.december, city.january, city.february].reduce(0, +) / 3).rounded()
            city.avg_temp_autumn = ([city.march, city.april, city.may].reduce(0, +) / 3).rounded()
            city.avg_temp_summer = ([city.june, city.july, city.august].reduce(0, +) / 3).rounded()
            city.avg_temp_fall = ([city.september, city.october, city.november].reduce(0, +) / 3).rounded()
            appDelegate.saveContext()
            self.name.text = cityName
            self.citySize.text = city.size
            autumnTemp.text = "\(Temperature(strategy: strategy).getValue(city.avg_temp_autumn))"
            summerTemp.text = "\(Temperature(strategy: strategy).getValue(city.avg_temp_summer))"
            winterTemp.text = "\(Temperature(strategy: strategy).getValue(city.avg_temp_winter))"
            fallTemp.text = "\(Temperature(strategy: strategy).getValue(city.avg_temp_fall))"
        } else {
            hideSplash(false)
        }
    }
    
    func hideSplash(_ state: Bool) {
        splashLabel.isHidden = state
        stackView.isHidden = !state
        name.isHidden = !state
        citySize.isHidden = !state
        winterText.isHidden = !state
        summerText.isHidden = !state
        fallText.isHidden = !state
        autumnText.isHidden = !state
    }
    
    func setupSubviews() {
        view.addSubview(stackView)
        view.addSubview(name)
        view.addSubview(splashLabel)
        view.addSubview(citySize)
        stackView.addArrangedSubview(winterTemp)
        stackView.addArrangedSubview(autumnTemp)
        stackView.addArrangedSubview(summerTemp)
        stackView.addArrangedSubview(fallTemp)
        
        winterText.translatesAutoresizingMaskIntoConstraints = false
        autumnText.translatesAutoresizingMaskIntoConstraints = false
        summerText.translatesAutoresizingMaskIntoConstraints = false
        fallText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(winterText)
        winterText.centerXAnchor.constraint(equalTo: winterTemp.centerXAnchor).isActive = true
        winterText.topAnchor.constraint(equalTo: winterTemp.bottomAnchor).isActive = true
//        winterText.widthAnchor.constraint(equalTo: winterTemp.widthAnchor).isActive = true
//        winterText.heightAnchor.constraint(equalTo: winterTemp.widthAnchor).isActive = true
        
        view.addSubview(autumnText)
        autumnText.centerXAnchor.constraint(equalTo: autumnTemp.centerXAnchor).isActive = true
        autumnText.topAnchor.constraint(equalTo: autumnTemp.bottomAnchor).isActive = true
//        autumnText.widthAnchor.constraint(equalTo: autumnTemp.widthAnchor).isActive = true
//        autumnText.heightAnchor.constraint(equalTo: autumnTemp.widthAnchor).isActive = true
        
        view.addSubview(summerText)
        summerText.centerXAnchor.constraint(equalTo: summerTemp.centerXAnchor).isActive = true
        summerText.topAnchor.constraint(equalTo: summerTemp.bottomAnchor).isActive = true
//        summerText.widthAnchor.constraint(equalTo: summerTemp.widthAnchor).isActive = true
//        summerText.heightAnchor.constraint(equalTo: summerTemp.widthAnchor).isActive = true
        
        view.addSubview(fallText)
        fallText.centerXAnchor.constraint(equalTo: fallTemp.centerXAnchor).isActive = true
        fallText.topAnchor.constraint(equalTo: fallTemp.bottomAnchor).isActive = true
//        fallText.widthAnchor.constraint(equalTo: fallTemp.widthAnchor).isActive = true
//        fallText.heightAnchor.constraint(equalTo: fallTemp.widthAnchor).isActive = true
    }
    
    func setupGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(presentCitiesList))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    @objc func presentCitiesList() {
        present(CitiesList())
    }
    
    @objc func didTap() {
        let view = CitySelector()
        view.delegate2 = self
        present(view, animated: true)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            citySize.centerXAnchor.constraint(equalTo: name.centerXAnchor),
            citySize.topAnchor.constraint(equalTo: name.bottomAnchor),
            
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: citySize.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
