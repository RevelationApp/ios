//
//  StateViewController.swift
//  RevelationUI
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

public final class StateViewController<
    L: UIView,
    E: UIView,
    R: UIView
>: ViewController {
    public enum ViewState {
        case loading
        case empty
        case content(UIViewController)
        case error
        case custom(UIView)
    }

    public let loadingView: L
    public let emptyView: E
    public let errorView: R

    var contentView: UIView!

    public var state: ViewState! {
        didSet {
            switch self.state! {
            case .loading: self.addContentView(self.loadingView)
            case .content(let vc): self.addContentViewController(vc)
            case .empty: self.addContentView(self.emptyView)
            case .error: self.addContentView(self.errorView)
            case .custom(let view): self.addContentView(view)
            }
        }
    }

    init(
        loadingView: L,
        emptyView: E,
        errorView: R
    ) {
        self.loadingView = loadingView
        self.emptyView = emptyView
        self.errorView = errorView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    public func addContentViewController(_ viewController: UIViewController) {
        self.title = viewController.title
        self.removeContentView()
        addChild(viewController)
        self.addEdgesSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func addEdgesSubview(_ view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: self.view.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ]
        )
    }

    func addContentView(_ view: UIView) {
        self.removeContentView()
        self.contentView = view
        self.addEdgesSubview(view)
    }

    func removeContentView() {
        self.contentView?.removeFromSuperview()
        self.contentView = nil
    }
}
