import RIBs

protocol PushPermissionDependency: Dependency {
}

final class PushPermissionComponent: Component<PushPermissionDependency> {

}

protocol PushPermissionBuildable: Buildable {
    func build(with listener: PushPermissionListener, rootViewController: UIViewController) -> PushPermissionRouting
}

final class PushPermissionBuilder: Builder<PushPermissionDependency>, PushPermissionBuildable {

    func build(with listener: PushPermissionListener, rootViewController: UIViewController) -> PushPermissionRouting {
        let viewController = rootViewController
        let interactor = PushPermissionInteractor()
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return PushPermissionRouter(interactor: interactor)
    }

}
