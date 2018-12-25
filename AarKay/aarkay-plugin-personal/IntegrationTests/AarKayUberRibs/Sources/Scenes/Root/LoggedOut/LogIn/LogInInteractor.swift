import RIBs

protocol LogInListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissLogIn()
    /// <aarkay LogInListener>
    /// </aarkay>
}

protocol LogInInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: LogInDependency! { get set }
    var router: LogInRouting! { get set }
    var listener: LogInListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

protocol LogInPresentable: Presentable {
    var listener: LogInPresentableListener! { get set }
}

final class LogInInteractor: PresentableInteractor<LogInPresentable>, LogInInteractable, LogInPresentableListener {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: LogInDependency!
    weak var router: LogInRouting!
    weak var listener: LogInListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay LogInInteractor>
    /// </aarkay>

    override init(presenter: LogInPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

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

    func didDismissLogIn() {
        listener.didDismissLogIn()
    }

}
