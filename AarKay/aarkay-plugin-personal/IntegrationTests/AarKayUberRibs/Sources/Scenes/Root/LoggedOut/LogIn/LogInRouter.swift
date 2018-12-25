import RIBs

enum LogInRouteType {
    case launch
    case present
    case logout
}

protocol LogInRouting: ViewableRouting {
    /// <aarkay LogInRouting>
    /// </aarkay>
}

final class LogInRouter: ViewableRouter<LogInInteractable, ViewControllable>, LogInRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var logInInteractor: LogInInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: LogInInteractable, viewController: ViewControllable) {
        self.logInInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

}
