import RIBs

protocol TncListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissTnc()
    /// <aarkay TncListener>
    /// </aarkay>
}

protocol TncInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: TncDependency! { get set }
    var router: TncRouting! { get set }
    var listener: TncListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

protocol TncPresentable: Presentable {
    var listener: TncPresentableListener! { get set }
}

final class TncInteractor: PresentableInteractor<TncPresentable>, TncInteractable, TncPresentableListener {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: TncDependency!
    weak var router: TncRouting!
    weak var listener: TncListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay TncInteractor>
    /// </aarkay>

    override init(presenter: TncPresentable) {
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

    func didDismissTnc() {
        listener.didDismissTnc()
    }

}
