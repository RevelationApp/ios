import RIBs

protocol LogInDependency: Dependency {
    var appService: AppService { get }
}

final class LogInComponent: Component<LogInDependency> {

    var appService: AppService {
        return dependency.appService
    }

}

protocol LogInBuildable: Buildable {
    func build(with listener: LogInListener, rootViewController: UIViewController) -> LogInRouting
}

final class LogInBuilder: Builder<LogInDependency>, LogInBuildable {

    func build(with listener: LogInListener, rootViewController: UIViewController) -> LogInRouting {
        let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! LogInViewController
        let interactor = LogInInteractor(presenter: viewController)
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return LogInRouter(interactor: interactor, viewController: viewController)
    }

}
