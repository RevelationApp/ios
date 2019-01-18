import Alamofire
import Foundation
import Restofire

public struct TvImagesGETService: Requestable, TvConfigurable {
    public typealias Response = Any

    public let pathModel: TvImagesPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.pathModel = TvImagesPathModel(tvId: tvId)
        self.path = "\(tvId)/images"
    }
}

public struct TvImagesPathModel {
    public let tvId: String
}
