import Foundation

public struct TvDetailsModel: Codable {
    public let backdropPath: String?
    public let firstAirDate: String
    public let genres: [GenreModel]
    public let id: Int
    public let homepage: String
    public let inProduction: Bool
    public let languages: [String]
    public let episodeRunTime: [Int]
    public let lastAirDate: String
    public let name: String
    public let overview: String
    public let originalName: String
    public let numberOfEpisodes: Int
    public let numberOfSeasons: Int
    public let originalLanguage: String?
    public let originCountry: [String]
    public let type: String
    public let popularity: Float
    public let posterPath: String?
    public let productionCompanies: [ProductionCompanyModel]?
    public let status: String
    public let voteAverage: Float?
    public let voteCount: Int?
    public let nextEpisodeToAir: EpisodeAirModel?
    public let lastEpisodeToAir: EpisodeAirModel?
    public let seasons: [SeasonModel]
    public let createdBy: [CreatedByModel]
    public let networks: [NetworkModel]

    public init(backdropPath: String?, firstAirDate: String, genres: [GenreModel], id: Int, homepage: String, inProduction: Bool, languages: [String], episodeRunTime: [Int], lastAirDate: String, name: String, overview: String, originalName: String, numberOfEpisodes: Int, numberOfSeasons: Int, originalLanguage: String?, originCountry: [String], type: String, popularity: Float, posterPath: String?, productionCompanies: [ProductionCompanyModel]?, status: String, voteAverage: Float?, voteCount: Int?, nextEpisodeToAir: EpisodeAirModel?, lastEpisodeToAir: EpisodeAirModel?, seasons: [SeasonModel], createdBy: [CreatedByModel], networks: [NetworkModel]) {
        self.backdropPath = backdropPath
        self.firstAirDate = firstAirDate
        self.genres = genres
        self.id = id
        self.homepage = homepage
        self.inProduction = inProduction
        self.languages = languages
        self.episodeRunTime = episodeRunTime
        self.lastAirDate = lastAirDate
        self.name = name
        self.overview = overview
        self.originalName = originalName
        self.numberOfEpisodes = numberOfEpisodes
        self.numberOfSeasons = numberOfSeasons
        self.originalLanguage = originalLanguage
        self.originCountry = originCountry
        self.type = type
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.status = status
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.nextEpisodeToAir = nextEpisodeToAir
        self.lastEpisodeToAir = lastEpisodeToAir
        self.seasons = seasons
        self.createdBy = createdBy
        self.networks = networks
    }
}
