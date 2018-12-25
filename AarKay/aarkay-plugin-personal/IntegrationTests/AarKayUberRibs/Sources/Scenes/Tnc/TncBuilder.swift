import RIBs

protocol TncDependency: Dependency {
}

final class TncComponent: Component<TncDependency> {

}

protocol TncBuildable: Buildable {
    func build(with listener: TncListener, rootViewController: UIViewController) -> TncRouting
}

final class TncBuilder: Builder<TncDependency>, TncBuildable {

    func build(with listener: TncListener, rootViewController: UIViewController) -> TncRouting {
        let viewController = TncViewController()
        let interactor = TncInteractor(presenter: viewController)
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return TncRouter(interactor: interactor, viewController: viewController)
    }

}
