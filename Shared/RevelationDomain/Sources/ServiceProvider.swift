//
//  ServiceProvider.swift
//  RevelationDomain
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation

public protocol ServiceProvider {
    var movieService: MovieService { get }
}
