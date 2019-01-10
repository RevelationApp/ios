import Alamofire
import Foundation
import Restofire

public struct DiscoverTvGETService: Requestable, DiscoverConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<TvModel>>

    public let path: String? = "tv"
    public let method: HTTPMethod = .get

    public init() {}
}
