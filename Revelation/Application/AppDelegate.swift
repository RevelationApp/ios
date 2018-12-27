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
    var appService: AppService = AppProvider()
    var router: AppRouter!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        router = AppRouter(
            window: window!,
            launchOptions: launchOptions,
            appService: appService
        )
        appService.setup { [weak self] in
            guard let _self = self else { return }
            _self.router.start()
        }
        
        return true
    }
    
}
