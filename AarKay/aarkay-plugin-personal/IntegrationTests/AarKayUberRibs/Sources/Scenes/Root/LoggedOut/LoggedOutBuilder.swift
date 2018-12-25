import RIBs

protocol LoggedOutDependency: Dependency {
    var appService: AppService { get }
}

final class LoggedOutComponent: Component<LoggedOutDependency>, TutorialDependency, SignUpDependency, LogInDependency, SyncDependency {

    var appService: AppService {
        return dependency.appService
    }

}

protocol LoggedOutBuildable: Buildable {
    func build(with listener: LoggedOutListener, rootViewController: UIViewController) -> LoggedOutRouting
}

final class LoggedOutBuilder: Builder<LoggedOutDependency>, LoggedOutBuildable {

    func build(with listener: LoggedOutListener, rootViewController: UIViewController) -> LoggedOutRouting {
        let component = LoggedOutComponent(dependency: dependency)
        let tutorialBuilder = TutorialBuilder(dependency: component)
        let signUpBuilder = SignUpBuilder(dependency: component)
        let logInBuilder = LogInBuilder(dependency: component)
        let syncBuilder = SyncBuilder(dependency: component)
        let viewController = rootViewController
        let interactor = LoggedOutInteractor()
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return LoggedOutRouter(interactor: interactor, tutorialBuilder: tutorialBuilder, signUpBuilder: signUpBuilder, logInBuilder: logInBuilder, syncBuilder: syncBuilder)
    }

}
