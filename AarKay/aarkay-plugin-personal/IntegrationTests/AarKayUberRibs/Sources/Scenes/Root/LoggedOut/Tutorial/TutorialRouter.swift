import RIBs

protocol TutorialRouting: ViewableRouting {
    /// <aarkay TutorialRouting>
    /// </aarkay>
}

final class TutorialRouter: ViewableRouter<TutorialInteractable, ViewControllable>, TutorialRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var tutorialInteractor: TutorialInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: TutorialInteractable, viewController: ViewControllable) {
        self.tutorialInteractor = interactor
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

}
