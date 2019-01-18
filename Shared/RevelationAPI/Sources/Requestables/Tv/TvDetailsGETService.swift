import Alamofire
import Foundation
import Restofire

public struct TvDetailsGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<TvDetailsModel>

    public let pathModel: TvDetailsPathModel
    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.pathModel = TvDetailsPathModel(tvId: tvId)
        self.path = "\(tvId)"
    }
}

public struct TvDetailsPathModel {
    public let tvId: String
}
