import RIBs

protocol LoggedInListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissLoggedIn()
    /// <aarkay LoggedInListener>
    /// </aarkay>
}

protocol LoggedInInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: LoggedInDependency! { get set }
    var router: LoggedInRouting! { get set }
    var listener: LoggedInListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: LoggedInDependency!
    weak var router: LoggedInRouting!
    weak var listener: LoggedInListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay LoggedInInteractor>
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

    func didDismissLoggedIn() {
        listener.didDismissLoggedIn()
    }

}
