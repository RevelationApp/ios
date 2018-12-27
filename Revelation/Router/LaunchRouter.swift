//
//  MainRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit
import RevelationUI
import RevelationDomain

class LaunchRouter {
    
    let appService: AppService
    let movieListRouter: MovieListRouter
    let tvListRouter: TvListRouter
    
    init(appService: AppService) {
        self.appService = appService
        self.movieListRouter = MovieListRouter(appService: appService)
        self.tvListRouter = TvListRouter(appService: appService)
    }
    
    func rootViewController() -> UIViewController {
        let rootViewController = UITabBarController()
        let movieListRootVC = movieListRouter.rootViewController()
        movieListRootVC.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        let tvListRootVC = tvListRouter.rootViewController()
        tvListRootVC.tabBarItem = UITabBarItem(title: "Tv", image: nil, selectedImage: nil)
        rootViewController.setViewControllers(
            [movieListRootVC, tvListRootVC],
            animated: false
        )
        return rootViewController
    }
    
}
