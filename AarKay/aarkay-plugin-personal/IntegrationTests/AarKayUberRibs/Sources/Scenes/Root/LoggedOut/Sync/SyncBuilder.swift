import RIBs

protocol SyncDependency: Dependency {
    var appService: AppService { get }
}

final class SyncComponent: Component<SyncDependency>, LocationPermissionDependency, PushPermissionDependency {

    var appService: AppService {
        return dependency.appService
    }

}

protocol SyncBuildable: Buildable {
    func build(with listener: SyncListener, rootViewController: UIViewController) -> SyncRouting
}

final class SyncBuilder: Builder<SyncDependency>, SyncBuildable {

    func build(with listener: SyncListener, rootViewController: UIViewController) -> SyncRouting {
        let component = SyncComponent(dependency: dependency)
        let locationPermissionBuilder = LocationPermissionBuilder(dependency: component)
        let pushPermissionBuilder = PushPermissionBuilder(dependency: component)
        let storyboard = UIStoryboard(name: "Sync", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SyncViewController
        let interactor = SyncInteractor(presenter: viewController)
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return SyncRouter(interactor: interactor, viewController: viewController, locationPermissionBuilder: locationPermissionBuilder, pushPermissionBuilder: pushPermissionBuilder)
    }

}
