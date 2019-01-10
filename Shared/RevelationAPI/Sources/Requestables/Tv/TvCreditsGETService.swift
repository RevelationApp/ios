import Alamofire
import Foundation
import Restofire

public struct TvCreditsGETService: Requestable, TvConfigurable {
    public typealias Response = ResultResponseModel<TvCreditsModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(tvId: String) {
        self.path = "\(tvId)/credits"
    }
}

public struct TvCreditsModel: Codable {
    public let id: Int
    public let cast: [TvCastModel]
    public let crew: [CrewModel]

    public init(id: Int, cast: [TvCastModel], crew: [CrewModel]) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }
}

public struct TvCastModel: Codable {
    public let character: String
    public let creditId: String
    public let gender: Int
    public let id: Int
    public let name: String
    public let order: Int
    public let profilePath: String?

    public init(character: String, creditId: String, gender: Int, id: Int, name: String, order: Int, profilePath: String?) {
        self.character = character
        self.creditId = creditId
        self.gender = gender
        self.id = id
        self.name = name
        self.order = order
        self.profilePath = profilePath
    }
}
