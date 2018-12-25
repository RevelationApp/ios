import RIBs

protocol PushPermissionRouting: Routing {
    /// <aarkay PushPermissionRouting>
    /// </aarkay>
}

final class PushPermissionRouter: Router<PushPermissionInteractable>, PushPermissionRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var pushPermissionInteractor: PushPermissionInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: PushPermissionInteractable) {
        self.pushPermissionInteractor = interactor
        super.init(interactor: interactor)
        interactor.router = self
    }

}
