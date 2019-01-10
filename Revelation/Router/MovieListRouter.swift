//
//  MovieListRouter.swift
//  Revelation
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import RevelationDomain
import RevelationUI
import RxCocoa
import RxSwift
import UIKit

class MovieListRouter {
    let appService: ServiceProvider

    init(appService: ServiceProvider) {
        self.appService = appService
    }

    func rootViewController() -> UIViewController {
        let listStateVC = StateVCFactory.build()
        listStateVC.title = "Movies"
        let rootViewController = UINavigationController(
            rootViewController: listStateVC
        )

        listStateVC.onViewDidLoad = { [weak self] in
            guard let _self = self else { return }
            listStateVC.state = .loading
            _self.appService.movieService.fetchAll { result, _ in
                guard let items = result else {
                    listStateVC.state = .error
                    return
                }
                guard items.count > 0 else {
                    listStateVC.state = .empty
                    return
                }
                let component = MovieTableViewComponent(
                    items: items,
                    onSelectBlock: { item in
                        let vc = _self.movieContainerViewController(movie: item)
                        rootViewController.pushViewController(vc, animated: true)
                    }
                )
                let vc = _self.moviesViewController(component: component)
                listStateVC.state = .content(vc)
            }
        }

        listStateVC.errorView.retryBlock = listStateVC.onViewDidLoad

        return rootViewController
    }

    private func moviesViewController(component: MovieTableViewComponent) -> UIViewController {
        let tableView = MovieTableViewBuilder.build(with: component)
        return GenericViewController<MovieTableView>(view: tableView)
    }

    private func movieContainerViewController(movie: Movie) -> UIViewController {
        if movie.detail != nil {
            return self.movieDetailViewController(movie: movie)
        } else {
            let listStateVC = StateVCFactory.build()
            listStateVC.title = movie.title
            listStateVC.onViewDidLoad = { [weak self] in
                guard let _self = self else { return }
                listStateVC.state = .loading
                _self.appService.movieService
                    .fetchWithId(movie.id) { movie, error in
                        guard let item = movie else {
                            print(error!)
                            listStateVC.state = .error
                            return
                        }
                        let vc = _self.movieDetailViewController(movie: item)
                        listStateVC.state = .content(vc)
                    }
            }
            listStateVC.errorView.retryBlock = listStateVC.onViewDidLoad
            return listStateVC
        }
    }

    private func movieDetailViewController(movie: Movie) -> UIViewController {
        let component = MovieTableViewComponent(
            items: [movie],
            onSelectBlock: { item in
                print(item)
            }
        )
        let vc = moviesViewController(component: component)
        vc.title = movie.title
        return vc
    }
}
