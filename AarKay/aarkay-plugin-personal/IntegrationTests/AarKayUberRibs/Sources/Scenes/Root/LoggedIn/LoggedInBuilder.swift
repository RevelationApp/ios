import RIBs

protocol LoggedInDependency: Dependency {
    var appService: AppService { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {

    var appService: AppService {
        return dependency.appService
    }

}

protocol LoggedInBuildable: Buildable {
    func build(with listener: LoggedInListener, rootViewController: UIViewController) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    func build(with listener: LoggedInListener, rootViewController: UIViewController) -> LoggedInRouting {
        let viewController = rootViewController
        let interactor = LoggedInInteractor()
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return LoggedInRouter(interactor: interactor)
    }

}
