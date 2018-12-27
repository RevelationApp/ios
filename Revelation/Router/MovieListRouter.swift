//
//  MovieListRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit
import RevelationUI
import RevelationDomain

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
            _self.appService.movieService.fetchAll() { collection, error in
                if let collection = collection {
                    if collection.count > 0 {
                        tableView.collection = collection
                        tableView.reloadData()
                        listStateVC.state = .content
                    } else {
                        listStateVC.state = .empty
                    }
                } else {
                    listStateVC.state = .error
                }
            }
        }
        let rootViewController = UINavigationController(
            rootViewController: listStateVC
        )
        return rootViewController
    }
    
}
