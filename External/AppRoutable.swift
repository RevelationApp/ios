//
//  Router.swift
//  Revelation
//
//  Created by RahulKatariya on 20/02/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//

import UIKit

public protocol AppRoutable {
    func rootViewController() -> UIViewController
    func route(with components: URLComponents)
}
