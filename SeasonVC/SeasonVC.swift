import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

enum Seasons {
    case summer, winter, autumn, fall
}

class SeasonVC: UIViewController {
    var season: Seasons?
    
    let temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityInfoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let citiesList = CitiesList()
    let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([temperatureLabel, cityInfoLabel])
        makeConstraints()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTemperature()
    }
    
    @objc func updateTemperature() {
        if let city = appDelegate.fetchCity(name: "Moscow") {
            var temperature: Measurement<UnitTemperature>
            switch season! {
                case .summer:
                    temperature = Measurement(value: city.avg_temp_summer, unit: UnitTemperature.celsius)
                case .winter:
                    temperature = Measurement(value: city.avg_temp_winter, unit: UnitTemperature.celsius)
                case .autumn:
                    temperature = Measurement(value: city.avg_temp_autumn, unit: UnitTemperature.celsius)
                case .fall:
                    temperature = Measurement(value: city.avg_temp_fall, unit: UnitTemperature.celsius)
            }
            temperatureLabel.text = "\(temperature.converted(to: .kelvin))"
        }
    }
    
    func setupGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentSettingsView)))
    }
    
    @objc func presentSettingsView() {
        citiesList.modalPresentationStyle = .overFullScreen
        present(citiesList, animated: true)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            temperatureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            cityInfoLabel.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor),
            cityInfoLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor),
        ])
    }
}