//
//  MovieRouter.swift
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

class MovieRouter {
    let service: ServiceProvider

    init(service: ServiceProvider) {
        self.service = service
    }

    func rootViewController() -> UIViewController {
        return UINavigationController(
            rootViewController: moviesStateViewController()
        )
    }

    private func moviesStateViewController() -> UIViewController {
        let disposeBag = DisposeBag()
        let listStateVC = StateVCFactory.build()
        listStateVC.onDataLoad = { [weak self, weak listStateVC] in
            guard let _self = self else { return }
            listStateVC?.state = .loading
            _self.service.movieService.fetchAll()
                .observeOn(MainScheduler.instance)
                .subscribe { event in
                    switch event {
                    case .success(let movies):
                        let vc = _self.moviesViewController(movies: movies)
                        vc.rootView.rx.itemSelected.asDriver()
                            .drive(onNext: { indexPath in
                                let id = movies[indexPath.row].id
                                let vc = _self.movieDetailStateViewController(id: id)
                                listStateVC?.navigationController?
                                    .pushViewController(vc, animated: true)
                            }).disposed(by: disposeBag)
                        listStateVC?.state = .content(vc)
                    case .error(let error):
                        listStateVC?.state = .error
                        print(error)
                    }
                }.disposed(by: disposeBag)
        }

        listStateVC.errorView.retryBlock = listStateVC.onDataLoad
        return listStateVC
    }

    private func moviesViewController(movies: [Movie]) -> GenericViewController<MovieTableView> {
        let component = MovieTableViewComponent(
            items: movies
        )
        let tableView = MovieTableViewBuilder.build(with: component)
        let vc = GenericViewController<MovieTableView>(view: tableView)
        vc.title = "Movies"
        return vc
    }

    private func movieDetailStateViewController(id: Int) -> UIViewController {
        let disposeBag = DisposeBag()
        let listStateVC = StateVCFactory.build()
        listStateVC.onDataLoad = { [weak self, weak listStateVC] in
            guard let _self = self else { return }
            listStateVC?.state = .loading
            _self.service.movieService.fetchWithId(id)
                .observeOn(MainScheduler.instance)
                .subscribe { event in
                    switch event {
                    case .success(let movie):
                        let vc = _self.movieDetailViewController(movie: movie)
                        vc.rootView.rx.itemSelected.asDriver()
                            .drive(onNext: { indexPath in
                                let vc = _self.movieDetailStateViewController(id: movie.id)
                                listStateVC?.navigationController?
                                    .pushViewController(vc, animated: true)
                            }).disposed(by: disposeBag)
                        listStateVC?.state = .content(vc)
                    case .error(let error):
                        listStateVC?.state = .error
                        print(error)
                    }
                }.disposed(by: disposeBag)
        }

        listStateVC.errorView.retryBlock = listStateVC.onDataLoad
        return listStateVC
    }

    private func movieDetailViewController(movie: Movie) -> GenericViewController<MovieTableView> {
        let component = MovieTableViewComponent(
            items: [movie]
        )
        let tableView = MovieTableViewBuilder.build(with: component)
        let vc = GenericViewController<MovieTableView>(view: tableView)
        vc.title = movie.title
        return vc
    }
}
