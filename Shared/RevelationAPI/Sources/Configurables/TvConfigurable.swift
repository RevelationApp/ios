import Restofire

protocol TvConfigurable: Configurable {}

extension TvConfigurable {
    static var tvConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/tv"
        return config
    }

    public var configuration: Configuration {
        return Self.tvConfiguration
    }
}
