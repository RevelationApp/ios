import RIBs

protocol LoggedOutListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissLoggedOut()
    /// <aarkay LoggedOutListener>
    /// </aarkay>
}

protocol LoggedOutInteractable: Interactable, TutorialListener, SignUpListener, LogInListener, SyncListener {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: LoggedOutDependency! { get set }
    var router: LoggedOutRouting! { get set }
    var listener: LoggedOutListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

final class LoggedOutInteractor: Interactor, LoggedOutInteractable {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: LoggedOutDependency!
    weak var router: LoggedOutRouting!
    weak var listener: LoggedOutListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay LoggedOutInteractor>
    /// </aarkay>

    @objc override func didBecomeActive() {
        /// <aarkay didBecomeActive>
        /// </aarkay>
    }

    @objc override func willResignActive() {
        /// <aarkay willResignActive>
        /// </aarkay>
    }

    func didUpdateRootViewController(_ viewController: UIViewController) {
        rootViewController = viewController
        listener.didUpdateRootViewController(viewController)
    }

    func didDismissLoggedOut() {
        listener.didDismissLoggedOut()
    }

    func didDismissTutorial() {
        router.detachTutorial()
    }

    func didDismissSignUp() {
        router.detachSignUp()
    }

    func didDismissLogIn() {
        router.detachLogIn()
    }

    func didDismissSync() {
        router.detachSync()
    }

}
