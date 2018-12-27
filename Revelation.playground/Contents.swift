//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import RevelationUI

let viewController = MovieListViewController()
let stateViewController = StateViewControllerFactory
    .build(
        contentViewController: viewController
    )

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = stateViewController
