import Alamofire
import Foundation
import Restofire

public struct TvDetailsGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<TvDetailsModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.path = "\(tvId)"
    }
}
