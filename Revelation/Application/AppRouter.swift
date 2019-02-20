//
//  AppRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 20/02/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//

import UIKit
import RevelationDomain

class AppRouter: AppRoutable {
    private let service: ServiceProvider
    private lazy var launchRouter = LaunchRouter(service: service)

    init(service: ServiceProvider) {
        self.service = service
    }

    func rootViewController() -> UIViewController {
        return launchRouter.rootViewController()
    }

    func route(with components: URLComponents) {
        print(components)
    }
}
