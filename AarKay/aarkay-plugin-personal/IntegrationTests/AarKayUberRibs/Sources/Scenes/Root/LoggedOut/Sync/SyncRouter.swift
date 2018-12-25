import RIBs

enum SyncRouteType {
    case launch
    case present
}

protocol SyncRouting: ViewableRouting {
    func routeToLocationPermission()
    func detachLocationPermission()
    func routeToPushPermission()
    func detachPushPermission()
    /// <aarkay SyncRouting>
    /// </aarkay>
}

final class SyncRouter: ViewableRouter<SyncInteractable, ViewControllable>, SyncRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var syncInteractor: SyncInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    private let locationPermissionBuilder: LocationPermissionBuildable
    private var locationPermissionRouting: LocationPermissionRouting!
    private let pushPermissionBuilder: PushPermissionBuildable
    private var pushPermissionRouting: PushPermissionRouting!

    init(interactor: SyncInteractable, viewController: ViewControllable, locationPermissionBuilder: LocationPermissionBuildable, pushPermissionBuilder: PushPermissionBuildable) {
        self.locationPermissionBuilder = locationPermissionBuilder
        self.pushPermissionBuilder = pushPermissionBuilder
        self.syncInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    // MARK: - LocationPermission

    func routeToLocationPermission() {
        locationPermissionRouting = locationPermissionBuilder.build(with: interactor, rootViewController: syncInteractor.rootViewController)
        attachChild(locationPermissionRouting)
        /// <aarkay routeToLocationPermission>
        /// </aarkay>
    }

    func detachLocationPermission() {
        detachChild(locationPermissionRouting)
        locationPermissionRouting = nil
    }

    // MARK: - PushPermission

    func routeToPushPermission() {
        pushPermissionRouting = pushPermissionBuilder.build(with: interactor, rootViewController: syncInteractor.rootViewController)
        attachChild(pushPermissionRouting)
        /// <aarkay routeToPushPermission>
        /// </aarkay>
    }

    func detachPushPermission() {
        detachChild(pushPermissionRouting)
        pushPermissionRouting = nil
    }

}
