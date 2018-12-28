//
//  AppDelegate.swift
//  Revelation
//
//  Created by RahulKatariya on 25/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appService = AppProvider()
    var router: AppRouter!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.router = AppRouter(
            window: self.window!,
            launchOptions: launchOptions,
            appService: self.appService
        )

        self.appService.setup { [unowned self] in
            self.router.start()
        }

        return true
    }
}
