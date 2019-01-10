import Restofire

protocol DiscoverConfigurable: Configurable {}

extension DiscoverConfigurable {
    static var discoverConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/discover"
        return config
    }

    public var configuration: Configuration {
        return Self.discoverConfiguration
    }
}
