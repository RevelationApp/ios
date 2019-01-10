import Alamofire
import Foundation
import Restofire

public struct MovieSimilarGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/similar"
    }
}
