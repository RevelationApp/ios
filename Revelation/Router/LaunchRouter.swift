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
    let appService: ServiceProvider
    let movieListRouter: MovieListRouter

    init(appService: ServiceProvider) {
        self.appService = appService
        self.movieListRouter = MovieListRouter(appService: appService)
    }

    func rootViewController() -> UIViewController {
        let rootViewController = UITabBarController()
        let movieListRootVC = movieListRouter.rootViewController()
        movieListRootVC.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        rootViewController.setViewControllers(
            [movieListRootVC],
            animated: false
        )
        return rootViewController
    }
}
