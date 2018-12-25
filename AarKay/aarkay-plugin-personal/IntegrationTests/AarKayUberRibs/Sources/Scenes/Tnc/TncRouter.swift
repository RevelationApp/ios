import RIBs

protocol TncRouting: ViewableRouting {
    /// <aarkay TncRouting>
    /// </aarkay>
}

final class TncRouter: ViewableRouter<TncInteractable, ViewControllable>, TncRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var tncInteractor: TncInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: TncInteractable, viewController: ViewControllable) {
        self.tncInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

}
