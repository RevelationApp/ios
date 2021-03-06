import Foundation

public struct EpisodeAirModel: Codable {
    public let airDate: String
    public let episodeNumber: Int
    public let id: Int
    public let name: String
    public let overview: String
    public let productionCode: String?
    public let showId: Int
    public let seasonNumber: Int
    public let stillPath: String?
    public let voteAverage: Float?
    public let voteCount: Int?

    public init(airDate: String, episodeNumber: Int, id: Int, name: String, overview: String, productionCode: String?, showId: Int, seasonNumber: Int, stillPath: String?, voteAverage: Float?, voteCount: Int?) {
        self.airDate = airDate
        self.episodeNumber = episodeNumber
        self.id = id
        self.name = name
        self.overview = overview
        self.productionCode = productionCode
        self.showId = showId
        self.seasonNumber = seasonNumber
        self.stillPath = stillPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
