import Alamofire
import Foundation
import Restofire

public struct MovieVideosGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<VideoModel>

    public let pathModel: MovieVideosPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.pathModel = MovieVideosPathModel(movieId: movieId)
        self.path = "\(movieId)/videos"
    }
}

public struct MovieVideosPathModel {
    public let movieId: String
}
