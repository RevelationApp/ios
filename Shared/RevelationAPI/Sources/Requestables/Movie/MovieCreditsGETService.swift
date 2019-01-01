//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//
//  Generated by AarKay on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Alamofire
import Foundation
import Restofire

public struct MovieCreditsGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<MovieCreditsModel>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/credits"
    }
}

public struct MovieCreditsModel: Codable {
    public let id: Int
    public let cast: [MovieCastModel]
    public let crew: [CrewModel]

    public init(id: Int, cast: [MovieCastModel], crew: [CrewModel]) {
        self.id = id
        self.cast = cast
        self.crew = crew
    }
}

public struct MovieCastModel: Codable {
    public let castId: Int
    public let character: String
    public let creditId: String
    public let gender: Int
    public let id: Int
    public let name: String
    public let order: Int
    public let profilePath: String?

    public init(castId: Int, character: String, creditId: String, gender: Int, id: Int, name: String, order: Int, profilePath: String?) {
        self.castId = castId
        self.character = character
        self.creditId = creditId
        self.gender = gender
        self.id = id
        self.name = name
        self.order = order
        self.profilePath = profilePath
    }
}
