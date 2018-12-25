//
//  AppService.swift
//  Flicks
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import FlicksDomain

protocol AppService: ServiceProvider {
    func setup(completion: @escaping () -> ())
}
