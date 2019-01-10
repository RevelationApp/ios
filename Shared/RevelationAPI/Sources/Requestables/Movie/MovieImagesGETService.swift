import Alamofire
import Foundation
import Restofire

public struct MovieImagesGETService: Requestable, MovieConfigurable {
    public typealias Response = Any

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/images"
    }
}
