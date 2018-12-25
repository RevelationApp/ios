import RIBs

protocol LocationPermissionDependency: Dependency {
}

final class LocationPermissionComponent: Component<LocationPermissionDependency> {

}

protocol LocationPermissionBuildable: Buildable {
    func build(with listener: LocationPermissionListener, rootViewController: UIViewController) -> LocationPermissionRouting
}

final class LocationPermissionBuilder: Builder<LocationPermissionDependency>, LocationPermissionBuildable {

    func build(with listener: LocationPermissionListener, rootViewController: UIViewController) -> LocationPermissionRouting {
        let viewController = rootViewController
        let interactor = LocationPermissionInteractor()
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return LocationPermissionRouter(interactor: interactor)
    }

}
