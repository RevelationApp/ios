import Alamofire
import Foundation
import Restofire

public struct MovieUpcomingGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>

    public let path: String? = "upcoming"
    public let method: HTTPMethod = .get

    public init() {}
}
