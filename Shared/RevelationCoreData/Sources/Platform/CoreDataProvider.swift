//
//  CoreDataProvider.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation
import RevelationDomain

public class CoreDataProvider {
    private let stack = RevelationCoreData.stack

    public init() {}

    public func setup(completion: @escaping () -> Void) {
        self.stack.setup(completion: completion)
    }

    public var movieService: MovieService { return CDMovieProvider(stack: self.stack) }
}
