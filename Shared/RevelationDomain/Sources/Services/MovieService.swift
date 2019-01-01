//
//  MovieUseCase.swift
//  RevelationDomain
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation

public protocol MovieService {
    func fetchAll(completion: @escaping ([Movie]?, Error?) -> Void)
    func fetchWithId(_ id: Int, completion: @escaping (Movie?, Error?) -> Void)
}
