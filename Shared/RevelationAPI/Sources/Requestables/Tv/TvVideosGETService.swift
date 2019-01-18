import Alamofire
import Foundation
import Restofire

public struct TvVideosGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<VideoModel>

    public let pathModel: TvVideosPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.pathModel = TvVideosPathModel(tvId: tvId)
        self.path = "\(tvId)/videos"
    }
}

public struct TvVideosPathModel {
    public let tvId: String
}
