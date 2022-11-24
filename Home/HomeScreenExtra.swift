import UIKit

extension HomeScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func updateUI() {
        if let city = city {
            hideUI(false)
            print(city)
        }
        hideUI(true)
    }
    
    func hideUI(_ state: Bool) {
        splashLabel.isHidden = !state
        stackView.isHidden = state
        name.isHidden = state
        citySize.isHidden = state
        winterText.isHidden = state
        summerText.isHidden = state
        fallText.isHidden = state
        autumnText.isHidden = state
    }
    
    func setupSubviews() {
        view.addSubview(name)
        view.addSubview(splashLabel)
        view.addSubview(citySize)
        
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
