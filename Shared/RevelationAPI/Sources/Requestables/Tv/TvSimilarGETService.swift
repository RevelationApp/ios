import Alamofire
import Foundation
import Restofire

public struct TvSimilarGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<TvModel>>

    public let pathModel: TvSimilarPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.pathModel = TvSimilarPathModel(tvId: tvId)
        self.path = "\(tvId)/similar"
    }
}

public struct TvSimilarPathModel {
    public let tvId: String
}
