//
//  AppDelegate.swift
//  Revelation
//
//  Created by RahulKatariya on 25/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

let scheme = "revalation://"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let service = AppProvider()
    private var coordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.coordinator = AppCoordinator(
            window: window,
            bootstrapper: AppBootstrapper(service: service),
            appRouter: AppRouter(service: service)
        )
        self.window = window

        if let url = launchOptions?[.url] as? URL {
            self.handle(route: url)
        } else {
            let url = URL(string: scheme + "applink")!
            self.handle(route: url)
        }

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let url = URL(string: scheme + "applink")!
        self.handle(route: url)
    }

    func application(
        _ application: UIApplication,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        let url = URL(string: scheme + "shortcut")!.appendingPathComponent(shortcutItem.type)
        completionHandler(handle(route: url))
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return handle(route: url)
    }

    @discardableResult
    func handle(route: URL) -> Bool {
        guard let components = URLComponents(url: route, resolvingAgainstBaseURL: false),
            components.host == "applink" || components.host == "shortcut" else {
                assertionFailure("\(route.path) is not supported")
                return false
        }
        self.coordinator.start(components: components)
        return true
    }
}
