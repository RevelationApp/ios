//
//  MovieUseCase.swift
//  RevelationDomain
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation
import RxSwift

public protocol MovieService {
    func fetchAll() -> Single<[Movie]>
    func fetchWithId(_ id: Int) -> Single<Movie>
}
