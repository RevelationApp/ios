//
//  ApplicationCoordinator.swift
//  Revelation
//
//  Created by RahulKatariya on 20/02/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//

import Foundation
import UIKit

public class AppCoordinator {
    private let window: UIWindow
    private let bootstrapper: AppBootstrapper
    private let appRouter: AppRoutable
    
    public init(
        window: UIWindow,
        bootstrapper: AppBootstrapper,
        appRouter: AppRoutable
    ) {
        self.window = window
        self.bootstrapper = bootstrapper
        self.appRouter = appRouter
        window.rootViewController = UIStoryboard(name: "LaunchScreen", bundle: nil)
            .instantiateInitialViewController()!
        window.makeKeyAndVisible()
    }
    
    public func start(components: URLComponents) {
        let coldLaunch = self.bootstrapper.bootstrap()
        if coldLaunch { self.window.rootViewController = self.appRouter.rootViewController() }
        if !components.path.isEmpty { self.appRouter.route(with: components) }
    }
}
