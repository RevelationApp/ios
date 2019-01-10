import Restofire

protocol PersonConfigurable: Configurable {}

extension PersonConfigurable {
    static var personConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/person"
        return config
    }

    public var configuration: Configuration {
        return Self.personConfiguration
    }
}
