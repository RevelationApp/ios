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

class CDMovieProvider: MovieService {
    let stack: CoreDataStack

    init(stack: CoreDataStack) {
        self.stack = stack
    }

    func fetchAll(completion: @escaping ([Movie]?, Error?) -> Void) {
        let request = DiscoverMovieGETService()
        CDDiscoverMovieSync(
            context: self.stack.newBackgroundContext(),
            request: request
        ).sync { error in
            if let error = error { completion(nil, error); return }
            let context = self.stack.newBackgroundContext()
            context.perform {
                do {
                    let results = try CDMovie.all(context: context)
                    DispatchQueue.main.async { completion(results, error) }
                } catch {
                    DispatchQueue.main.async { completion(nil, error) }
                }
            }
        }
    }

    func fetchWithId(_ id: Int, completion: @escaping (Movie?, Error?) -> Void) {
        let request = MovieDetailsGETService(movieId: "\(id)")
        CDMovieDetailsSync(
            context: self.stack.newBackgroundContext(),
            request: request
        ).sync { error in
            guard error == nil else { completion(nil, error); return }
            let context = self.stack.newBackgroundContext()
            context.perform {
                do {
                    if let result = try CDMovie.fetch(id: Int64(id), context: context),
                        let detail = result.detail {
                        var model = CDMovie.asDomain(item: result)
                        let detailModel = CDMovieDetail.asDomain(item: detail)
                        model.detail = detailModel
                        DispatchQueue.main.async { completion(model, nil) }
                    } else {
                        fatalError("Movie with \(id) doesn't exist in db")
                    }
                } catch {
                    DispatchQueue.main.async { completion(nil, error) }
                }
            }
        }
    }
}
