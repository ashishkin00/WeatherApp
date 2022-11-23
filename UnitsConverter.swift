import Foundation

protocol TemperatureStrategy {
    func getValue(_ value: Double) -> Measurement<UnitTemperature>
}

struct Temperature {
    let strategy: TemperatureStrategy
    func getValue(_ value: Double) -> Measurement<UnitTemperature> {
        strategy.getValue(value)
    }
}

struct KelvinStrategy: TemperatureStrategy {
    func getValue(_ value: Double) -> Measurement<UnitTemperature> {
        Measurement(value: value, unit: .celsius).converted(to: .kelvin)
    }
}

struct CelsiusStrategy: TemperatureStrategy {
    func getValue(_ value: Double) -> Measurement<UnitTemperature> {
        Measurement(value: value, unit: .celsius).converted(to: .celsius)
    }
}

struct FahrenheitStrategy: TemperatureStrategy {
    func getValue(_ value: Double) -> Measurement<UnitTemperature> {
        Measurement(value: value, unit: .celsius).converted(to: .fahrenheit)
    }
}
