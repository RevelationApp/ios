import Restofire

protocol TrendingConfigurable: Configurable {}

extension TrendingConfigurable {
    static var trendingConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/trending"
        return config
    }

    public var configuration: Configuration {
        return Self.trendingConfiguration
    }
}
