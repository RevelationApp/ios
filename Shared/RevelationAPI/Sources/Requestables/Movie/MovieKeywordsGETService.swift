import Alamofire
import Foundation
import Restofire

public struct MovieKeywordsGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<MovieKeywordsModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/keywords"
    }
}

public struct MovieKeywordsModel: Codable {
    public let id: Int
    public let keywords: [KeywordModel]

    public init(id: Int, keywords: [KeywordModel]) {
        self.id = id
        self.keywords = keywords
    }
}

public struct KeywordModel: Codable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
