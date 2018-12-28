//
//  AppRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import RevelationDomain
import UIKit

class AppRouter {
    let window: UIWindow
    let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    let appService: ServiceProvider
    let launchRouter: LaunchRouter

    init(
        window: UIWindow,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
        appService: ServiceProvider
    ) {
        self.window = window
        self.launchOptions = launchOptions
        self.appService = appService
        self.launchRouter = LaunchRouter(appService: appService)
        let viewController = UIStoryboard(name: "LaunchScreen", bundle: nil)
            .instantiateInitialViewController()!
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func start() {
        self.window.rootViewController = self.launchRouter.rootViewController()
    }
}
