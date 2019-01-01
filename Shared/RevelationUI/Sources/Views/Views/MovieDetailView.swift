//
//  MovieDetailView.swift
//  RevelationUI
//
//  Created by RahulKatariya on 30/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import RevelationDomain
import UIKit

class MovieDetailView: UIView {
    let movie: Movie

    init(movie: Movie) {
        precondition(movie.detail != nil)
        self.movie = movie
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
