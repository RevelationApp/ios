import RIBs

protocol LocationPermissionRouting: Routing {
    /// <aarkay LocationPermissionRouting>
    /// </aarkay>
}

final class LocationPermissionRouter: Router<LocationPermissionInteractable>, LocationPermissionRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var locationPermissionInteractor: LocationPermissionInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: LocationPermissionInteractable) {
        self.locationPermissionInteractor = interactor
        super.init(interactor: interactor)
        interactor.router = self
    }

}
