import Alamofire
import Foundation
import Restofire

public struct MovieVideosGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<VideoModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/videos"
    }
}
