//
//  MovieListRouter.swift
//  Flicks
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit
import FlicksUI
import FlicksDomain

class MovieListRouter {
    
    let appService: AppService
    
    init(appService: AppService) {
        self.appService = appService
    }
    
    func rootViewController() -> UIViewController {
        let tableView = MovieTableView()
        let listVC = UIViewController()
        listVC.reactive.loadView.observe { _ in
            listVC.view = tableView
        }
        let listStateVC = StateViewControllerFactory
            .build(contentViewController: listVC)
        listVC.reactive.viewDidLoad.observe { [weak self] _ in
            guard let _self = self else { return }
            listStateVC.state = .loading
            _self.appService.movieService.fetchAll() { collection in
                if collection.count > 0 {
                    tableView.collection = collection
                    tableView.reloadData()
                    listStateVC.state = .content
                } else {
                    listStateVC.state = .empty
                }
            }
        }
        let rootViewController = UINavigationController(
            rootViewController: listStateVC
        )
        return rootViewController
    }
    
}
