import RIBs

protocol RootDependency: Dependency {
    var appService: AppService { get }
}

final class RootComponent: Component<RootDependency>, LoggedInDependency, LoggedOutDependency {

    var rootViewController: UIViewController = {
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }()

    var appService: AppService {
        return dependency.appService
    }

}

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    func build() -> RootRouting {
        let component = RootComponent(dependency: dependency)
        let loggedInBuilder = LoggedInBuilder(dependency: component)
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let viewController = component.rootViewController
        let interactor = RootInteractor()
        interactor.dependency = dependency
        interactor.rootViewController = viewController
        return RootRouter(interactor: interactor, viewController: viewController, loggedInBuilder: loggedInBuilder, loggedOutBuilder: loggedOutBuilder)
    }

}
