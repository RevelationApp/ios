//: A UIKit based Playground for presenting user interface

import PlaygroundSupport
import RevelationUI
import UIKit

let viewController = MovieListViewController()
let stateViewController = StateViewControllerFactory
    .build(
        contentViewController: viewController
    )

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = stateViewController
