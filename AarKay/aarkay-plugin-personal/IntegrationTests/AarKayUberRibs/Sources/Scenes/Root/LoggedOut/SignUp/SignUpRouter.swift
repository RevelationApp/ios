import RIBs

protocol SignUpRouting: ViewableRouting {
    func routeToTnc()
    func detachTnc()
    /// <aarkay SignUpRouting>
    /// </aarkay>
}

final class SignUpRouter: ViewableRouter<SignUpInteractable, ViewControllable>, SignUpRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var signUpInteractor: SignUpInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    private let tncBuilder: TncBuildable
    private var tncRouting: TncRouting!

    init(interactor: SignUpInteractable, viewController: ViewControllable, tncBuilder: TncBuildable) {
        self.tncBuilder = tncBuilder
        self.signUpInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    // MARK: - Tnc

    func routeToTnc() {
        tncRouting = tncBuilder.build(with: interactor, rootViewController: signUpInteractor.rootViewController)
        attachChild(tncRouting)
        /// <aarkay routeToTnc>
        /// </aarkay>
    }

    func detachTnc() {
        detachChild(tncRouting)
        tncRouting = nil
    }

}
