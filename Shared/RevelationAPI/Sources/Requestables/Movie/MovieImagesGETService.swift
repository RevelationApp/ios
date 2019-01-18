import Alamofire
import Foundation
import Restofire

public struct MovieImagesGETService: Requestable, MovieConfigurable {
    public typealias Response = Any

    public let pathModel: MovieImagesPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.pathModel = MovieImagesPathModel(movieId: movieId)
        self.path = "\(movieId)/images"
    }
}

public struct MovieImagesPathModel {
    public let movieId: String
}
