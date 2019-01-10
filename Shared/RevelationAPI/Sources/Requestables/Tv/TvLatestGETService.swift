import Alamofire
import Foundation
import Restofire

public struct TvLatestGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<TvDetailsModel>

    public let path: String? = "latest"
    public let method: HTTPMethod = .get

    public init() {}
}
