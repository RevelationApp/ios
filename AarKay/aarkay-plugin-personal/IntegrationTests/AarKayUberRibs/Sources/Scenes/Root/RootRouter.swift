import RIBs

protocol RootRouting: LaunchRouting {
    func routeToLoggedIn()
    func detachLoggedIn()
    func routeToLoggedOut()
    func detachLoggedOut()
    /// <aarkay RootRouting>
    /// </aarkay>
}

final class RootRouter: LaunchRouter<RootInteractable, ViewControllable>, RootRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var rootInteractor: RootInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    private let loggedInBuilder: LoggedInBuildable
    private var loggedInRouting: LoggedInRouting!
    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOutRouting: LoggedOutRouting!

    init(interactor: RootInteractable, viewController: ViewControllable, loggedInBuilder: LoggedInBuildable, loggedOutBuilder: LoggedOutBuildable) {
        self.loggedInBuilder = loggedInBuilder
        self.loggedOutBuilder = loggedOutBuilder
        self.rootInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    // MARK: - LoggedIn

    func routeToLoggedIn() {
        loggedInRouting = loggedInBuilder.build(with: interactor, rootViewController: rootInteractor.rootViewController)
        attachChild(loggedInRouting)
        /// <aarkay routeToLoggedIn>
        /// </aarkay>
    }

    func detachLoggedIn() {
        detachChild(loggedInRouting)
        loggedInRouting = nil
    }

    // MARK: - LoggedOut

    func routeToLoggedOut() {
        loggedOutRouting = loggedOutBuilder.build(with: interactor, rootViewController: rootInteractor.rootViewController)
        attachChild(loggedOutRouting)
        /// <aarkay routeToLoggedOut>
        /// </aarkay>
    }

    func detachLoggedOut() {
        detachChild(loggedOutRouting)
        loggedOutRouting = nil
    }

}
