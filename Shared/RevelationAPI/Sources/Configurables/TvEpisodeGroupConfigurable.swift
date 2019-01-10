import Restofire

protocol TvEpisodeGroupConfigurable: Configurable {}

extension TvEpisodeGroupConfigurable {
    static var tvEpisodeGroupConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/tv/episode_group"
        return config
    }

    public var configuration: Configuration {
        return Self.tvEpisodeGroupConfiguration
    }
}
