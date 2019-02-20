//
//  MainRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import RevelationDomain
import RevelationUI
import UIKit

class LaunchRouter {
    let service: ServiceProvider
    let movieRouter: MovieRouter

    init(service: ServiceProvider) {
        self.service = service
        self.movieRouter = MovieRouter(service: service)
    }

    func rootViewController() -> UIViewController {
        let rootViewController = UITabBarController()
        let movieRootVC = movieRouter.rootViewController()
        movieRootVC.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        rootViewController.setViewControllers(
            [movieRootVC],
            animated: false
        )
        return rootViewController
    }
}
