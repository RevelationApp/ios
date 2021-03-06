import Foundation

public struct SeasonModel: Codable {
    public let airDate: String?
    public let episodeCount: Int
    public let id: Int
    public let name: String
    public let overview: String
    public let seasonNumber: Int
    public let posterPath: String?

    public init(airDate: String?, episodeCount: Int, id: Int, name: String, overview: String, seasonNumber: Int, posterPath: String?) {
        self.airDate = airDate
        self.episodeCount = episodeCount
        self.id = id
        self.name = name
        self.overview = overview
        self.seasonNumber = seasonNumber
        self.posterPath = posterPath
    }
}
