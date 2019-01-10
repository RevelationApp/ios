//
//  Movie.swift
//  RevelationUI
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    public let id: Int
    public let title: String
    public let description: String
    public var imageUrl: URL?
    public var detail: MovieDetail?

    public init(
        id: Int,
        title: String,
        description: String
    ) {
        self.id = id
        self.title = title
        self.description = description
    }
}

public struct MovieDetail: Codable {
    public var imdbId: String?

    public init() {}
}
