import RIBs

protocol TutorialDependency: Dependency {
    var appService: AppService { get }
}

final class TutorialComponent: Component<TutorialDependency> {

    var appService: AppService {
        return dependency.appService
    }

}

protocol TutorialBuildable: Buildable {
    func build(with listener: TutorialListener, rootViewController: UIViewController) -> TutorialRouting
}

final class TutorialBuilder: Builder<TutorialDependency>, TutorialBuildable {

    func build(with listener: TutorialListener, rootViewController: UIViewController) -> TutorialRouting {
        let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! TutorialViewController
        let interactor = TutorialInteractor(presenter: viewController)
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return TutorialRouter(interactor: interactor, viewController: viewController)
    }

}
