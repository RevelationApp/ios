import Foundation

public struct TvModel: Codable {
    public let backdropPath: String?
    public let firstAirDate: String
    public let genreIds: [Int]
    public let id: Int
    public let name: String
    public let originCountry: [String]
    public let originalLanguage: String
    public let originalName: String
    public let overview: String
    public let popularity: Float
    public let posterPath: String?
    public let voteAverage: Float
    public let voteCount: Int

    public init(backdropPath: String?, firstAirDate: String, genreIds: [Int], id: Int, name: String, originCountry: [String], originalLanguage: String, originalName: String, overview: String, popularity: Float, posterPath: String?, voteAverage: Float, voteCount: Int) {
        self.backdropPath = backdropPath
        self.firstAirDate = firstAirDate
        self.genreIds = genreIds
        self.id = id
        self.name = name
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
