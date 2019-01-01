//
//  TvService.swift
//  RevelationDomain
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation

public protocol TvService {
    func fetchAll(completion: @escaping ([Tv]?, Error?) -> Void)
}
