import Alamofire
import Foundation
import Restofire

public struct MovieDetailsGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<MovieDetailsModel>

    public let pathModel: MovieDetailsPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.pathModel = MovieDetailsPathModel(movieId: movieId)
        self.path = "\(movieId)"
    }
}

public struct MovieDetailsPathModel {
    public let movieId: String
}

public struct MovieDetailsModel: Codable {
    public let id: Int
    public let adult: Bool
    public let backdropPath: String?
    public let budget: Int
    public let homepage: String?
    public let genres: [GenreModel]
    public let imdbId: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String
    public let popularity: Float
    public let posterPath: String?
    public let productionCompanies: [ProductionCompanyModel]?
    public let spokenLanguages: [SpokenLanguageModel]?
    public let releaseDate: String?
    public let revenue: Int
    public let runtime: Int?
    public let status: String
    public let tagline: String
    public let title: String
    public let video: Bool
    public let voteAverage: Float?
    public let voteCount: Int?

    public init(id: Int, adult: Bool, backdropPath: String?, budget: Int, homepage: String?, genres: [GenreModel], imdbId: String?, originalLanguage: String?, originalTitle: String?, overview: String, popularity: Float, posterPath: String?, productionCompanies: [ProductionCompanyModel]?, spokenLanguages: [SpokenLanguageModel]?, releaseDate: String?, revenue: Int, runtime: Int?, status: String, tagline: String, title: String, video: Bool, voteAverage: Float?, voteCount: Int?) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.budget = budget
        self.homepage = homepage
        self.genres = genres
        self.imdbId = imdbId
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.spokenLanguages = spokenLanguages
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
