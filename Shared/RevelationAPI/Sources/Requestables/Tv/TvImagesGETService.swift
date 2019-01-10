import Alamofire
import Foundation
import Restofire

public struct TvImagesGETService: Requestable, TvConfigurable {
    public typealias Response = Any

    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.path = "\(tvId)/images"
    }
}
