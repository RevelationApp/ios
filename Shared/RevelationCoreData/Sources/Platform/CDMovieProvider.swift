//
//  SetupProvider.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData
import Foundation
import RevelationAPI
import RevelationDomain
import RxSwift

class CDMovieProvider: MovieService {
    let stack: CoreDataStack

    init(stack: CoreDataStack) {
        self.stack = stack
    }

    func fetchAll() -> Single<[Movie]> {
        return Single<[Movie]>.create { single in
            let request = DiscoverMovieGETService()
            let cancellabe = CDDiscoverMovieSync(
                context: self.stack.newBackgroundContext(),
                request: request
            ).sync { error in
                if let error = error { single(.error(error)) }
                    let context = self.stack.newBackgroundContext()
                    context.perform {
                        do {
                            let results = try CDMovie.all(context: context)
                            single(.success(results))
                        } catch {
                            single(.error(error))
                        }
                    }
            }
            return Disposables.create { cancellabe?.cancel() }
        }
    }

    func fetchWithId(_ id: Int) -> Single<Movie> {
        return Single<Movie>.create { single in
            let request = MovieDetailsGETService(movieId: "\(id)")
            let cancellable = CDMovieDetailsSync(
                context: self.stack.newBackgroundContext(),
                request: request
            ).sync { error in
                guard error == nil else { single(.error(error!)); return }
                let context = self.stack.newBackgroundContext()
                context.perform {
                    do {
                        if let result = try CDMovie.fetch(id: Int64(id), context: context),
                            let detail = result.detail {
                            var model = CDMovie.asDomain(item: result)
                            let detailModel = CDMovieDetail.asDomain(item: detail)
                            model.detail = detailModel
                            single(.success(model))
                        } else {
                            fatalError("Movie with \(id) doesn't exist in db")
                        }
                    } catch {
                        single(.error(error))
                    }
                }
            }
            return Disposables.create { cancellable?.cancel() }
        }
    }
}
