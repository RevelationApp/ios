import Foundation

public struct MovieModel: Codable {
    public let id: Int
    public let title: String
    public let overview: String
    public let voteCount: Int
    public let video: Bool
    public let voteAverage: Float
    public let popularity: Float
    public let posterPath: String?
    public let originalLanguage: String
    public let originalTitle: String
    public let genreIds: [Int]
    public let backdropPath: String?
    public let adult: Bool
    public let releaseDate: String

    public init(id: Int, title: String, overview: String, voteCount: Int, video: Bool, voteAverage: Float, popularity: Float, posterPath: String?, originalLanguage: String, originalTitle: String, genreIds: [Int], backdropPath: String?, adult: Bool, releaseDate: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIds = genreIds
        self.backdropPath = backdropPath
        self.adult = adult
        self.releaseDate = releaseDate
    }
}
