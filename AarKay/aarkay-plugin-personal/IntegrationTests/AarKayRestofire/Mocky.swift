import Restofire

protocol MockyConfigurable: Configurable {}

extension MockyConfigurable {

    static var mockyConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/apis/mocky"
        return config
    }

    public var configuration: Configuration {
        return Self.mockyConfiguration
    }

}
