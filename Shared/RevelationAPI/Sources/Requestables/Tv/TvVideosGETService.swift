import Alamofire
import Foundation
import Restofire

public struct TvVideosGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<VideoModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.path = "\(tvId)/videos"
    }
}
