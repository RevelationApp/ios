import Restofire

protocol HTTPBinConfigurable: Configurable {}

extension HTTPBinConfigurable {

    static var hTTPBinConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = "httpbin.org"
        return config
    }

    public var configuration: Configuration {
        return Self.hTTPBinConfiguration
    }

}
