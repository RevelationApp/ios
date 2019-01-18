import Alamofire
import Foundation
import Restofire

public struct MovieSimilarGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>

    public let pathModel: MovieSimilarPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.pathModel = MovieSimilarPathModel(movieId: movieId)
        self.path = "\(movieId)/similar"
    }
}

public struct MovieSimilarPathModel {
    public let movieId: String
}
