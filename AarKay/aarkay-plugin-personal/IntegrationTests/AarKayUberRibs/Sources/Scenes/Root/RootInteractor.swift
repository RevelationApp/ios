import RIBs

protocol RootInteractable: Interactable, LoggedInListener, LoggedOutListener {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: RootDependency! { get set }
    var router: RootRouting! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

final class RootInteractor: Interactor, RootInteractable {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: RootDependency!
    weak var router: RootRouting!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay RootInteractor>
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
    }

    func didDismissLoggedIn() {
        router.detachLoggedIn()
    }

    func didDismissLoggedOut() {
        router.detachLoggedOut()
    }

}
