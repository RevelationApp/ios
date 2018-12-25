import RIBs

protocol PushPermissionListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissPushPermission()
    /// <aarkay PushPermissionListener>
    /// </aarkay>
}

protocol PushPermissionInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: PushPermissionDependency! { get set }
    var router: PushPermissionRouting! { get set }
    var listener: PushPermissionListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

final class PushPermissionInteractor: Interactor, PushPermissionInteractable {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: PushPermissionDependency!
    weak var router: PushPermissionRouting!
    weak var listener: PushPermissionListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay PushPermissionInteractor>
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

    func didDismissPushPermission() {
        listener.didDismissPushPermission()
    }

}
