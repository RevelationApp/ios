import RIBs

protocol LocationPermissionListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissLocationPermission()
    /// <aarkay LocationPermissionListener>
    /// </aarkay>
}

protocol LocationPermissionInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: LocationPermissionDependency! { get set }
    var router: LocationPermissionRouting! { get set }
    var listener: LocationPermissionListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

final class LocationPermissionInteractor: Interactor, LocationPermissionInteractable {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: LocationPermissionDependency!
    weak var router: LocationPermissionRouting!
    weak var listener: LocationPermissionListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay LocationPermissionInteractor>
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

    func didDismissLocationPermission() {
        listener.didDismissLocationPermission()
    }

}
