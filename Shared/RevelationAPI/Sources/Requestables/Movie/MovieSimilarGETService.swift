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

public struct MovieSimilarGETService: Requestable, MovieConfigurable {
    public typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>

    public let path: String?
    public let method: HTTPMethod = .get

    public init(movieId: String) {
        self.path = "\(movieId)/similar"
    }
}
