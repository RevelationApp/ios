import RIBs

protocol SyncListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissSync()
    /// <aarkay SyncListener>
    /// </aarkay>
}

protocol SyncInteractable: Interactable, LocationPermissionListener, PushPermissionListener {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: SyncDependency! { get set }
    var router: SyncRouting! { get set }
    var listener: SyncListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

protocol SyncPresentable: Presentable {
    var listener: SyncPresentableListener! { get set }
}

final class SyncInteractor: PresentableInteractor<SyncPresentable>, SyncInteractable, SyncPresentableListener {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: SyncDependency!
    weak var router: SyncRouting!
    weak var listener: SyncListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay SyncInteractor>
    /// </aarkay>

    override init(presenter: SyncPresentable) {
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

    func didDismissSync() {
        listener.didDismissSync()
    }

    func didDismissLocationPermission() {
        router.detachLocationPermission()
    }

    func didDismissPushPermission() {
        router.detachPushPermission()
    }

}
