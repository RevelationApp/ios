import Alamofire
import Foundation
import Restofire

public struct DiscoverMovieGETService: Requestable, DiscoverConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>

    public let path: String? = "movie"
    public let method: HTTPMethod = .get

    public init() {}
}
