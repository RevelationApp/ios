import Restofire

protocol MovieConfigurable: Configurable {}

extension MovieConfigurable {
    static var movieConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/movie"
        return config
    }

    public var configuration: Configuration {
        return Self.movieConfiguration
    }
}
