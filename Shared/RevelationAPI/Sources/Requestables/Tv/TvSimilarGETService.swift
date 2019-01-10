import Alamofire
import Foundation
import Restofire

public struct TvSimilarGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<TvModel>>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.path = "\(tvId)/similar"
    }
}
