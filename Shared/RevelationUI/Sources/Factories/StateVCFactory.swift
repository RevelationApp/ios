//
//  StateVCFactory.swift
//  RevelationUI
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

public class StateVCFactory {
    public static func build() -> StateViewController<LoadingView, EmptyView, ErrorView> {
        let loadingView: LoadingView = LoadingView.loadFromNib()
        let emptyView: EmptyView = EmptyView.loadFromNib()
        let errorView: ErrorView = ErrorView.loadFromNib()
        return self.build(loadingView: loadingView, emptyView: emptyView, errorView: errorView)
    }

    public static func build<L, E, R>(
        loadingView: L,
        emptyView: E,
        errorView: R
    ) -> StateViewController<L, E, R> {
        let stateVC = StateViewController<L, E, R>(
            loadingView: loadingView,
            emptyView: emptyView,
            errorView: errorView
        )
        return stateVC
    }
}
