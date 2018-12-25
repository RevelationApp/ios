import RIBs

protocol LoggedOutRouting: Routing {
    func routeToTutorial()
    func detachTutorial()
    func routeToSignUp(phoneNumber: String?)
    func detachSignUp()
    func routeToLogIn(routeType: LogInRouteType)
    func detachLogIn()
    func routeToSync(routeType: SyncRouteType)
    func detachSync()
    /// <aarkay LoggedOutRouting>
    /// </aarkay>
}

final class LoggedOutRouter: Router<LoggedOutInteractable>, LoggedOutRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var loggedOutInteractor: LoggedOutInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    private let tutorialBuilder: TutorialBuildable
    private var tutorialRouting: TutorialRouting!
    private let signUpBuilder: SignUpBuildable
    private var signUpRouting: SignUpRouting!
    private let logInBuilder: LogInBuildable
    private var logInRouting: LogInRouting!
    private let syncBuilder: SyncBuildable
    private var syncRouting: SyncRouting!

    init(interactor: LoggedOutInteractable, tutorialBuilder: TutorialBuildable, signUpBuilder: SignUpBuildable, logInBuilder: LogInBuildable, syncBuilder: SyncBuildable) {
        self.tutorialBuilder = tutorialBuilder
        self.signUpBuilder = signUpBuilder
        self.logInBuilder = logInBuilder
        self.syncBuilder = syncBuilder
        self.loggedOutInteractor = interactor
        super.init(interactor: interactor)
        interactor.router = self
    }

    // MARK: - Tutorial

    func routeToTutorial() {
        tutorialRouting = tutorialBuilder.build(with: interactor, rootViewController: loggedOutInteractor.rootViewController)
        attachChild(tutorialRouting)
        /// <aarkay routeToTutorial>
        /// </aarkay>
    }

    func detachTutorial() {
        detachChild(tutorialRouting)
        tutorialRouting = nil
    }

    // MARK: - SignUp

    func routeToSignUp(phoneNumber: String?) {
        signUpRouting = signUpBuilder.build(with: interactor, rootViewController: loggedOutInteractor.rootViewController, phoneNumber: phoneNumber)
        attachChild(signUpRouting)
        /// <aarkay routeToSignUp>
        /// </aarkay>
    }

    func detachSignUp() {
        detachChild(signUpRouting)
        signUpRouting = nil
    }

    // MARK: - LogIn

    func routeToLogIn(routeType: LogInRouteType) {
        logInRouting = logInBuilder.build(with: interactor, rootViewController: loggedOutInteractor.rootViewController)
        attachChild(logInRouting)
        /// <aarkay routeToLogIn>
        /// </aarkay>
    }

    func detachLogIn() {
        detachChild(logInRouting)
        logInRouting = nil
    }

    // MARK: - Sync

    func routeToSync(routeType: SyncRouteType) {
        syncRouting = syncBuilder.build(with: interactor, rootViewController: loggedOutInteractor.rootViewController)
        attachChild(syncRouting)
        /// <aarkay routeToSync>
        /// </aarkay>
    }

    func detachSync() {
        detachChild(syncRouting)
        syncRouting = nil
    }

}
