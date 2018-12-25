import RIBs

protocol SignUpListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissSignUp()
    /// <aarkay SignUpListener>
    /// </aarkay>
}

protocol SignUpInteractable: Interactable, TncListener {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: SignUpDependency! { get set }
    var router: SignUpRouting! { get set }
    var listener: SignUpListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

protocol SignUpPresentable: Presentable {
    var listener: SignUpPresentableListener! { get set }
}

final class SignUpInteractor: PresentableInteractor<SignUpPresentable>, SignUpInteractable, SignUpPresentableListener {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: SignUpDependency!
    weak var router: SignUpRouting!
    weak var listener: SignUpListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay SignUpInteractor>
    /// </aarkay>

    override init(presenter: SignUpPresentable) {
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

    func didDismissSignUp() {
        listener.didDismissSignUp()
    }

    func didDismissTnc() {
        router.detachTnc()
    }

}
