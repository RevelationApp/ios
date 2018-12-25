import RIBs

protocol TutorialListener: class {
    func didUpdateRootViewController(_ viewController: UIViewController)
    func didDismissTutorial()
    /// <aarkay TutorialListener>
    /// </aarkay>
}

protocol TutorialInteractable: Interactable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootViewController: UIViewController! { get set }
    var dependency: TutorialDependency! { get set }
    var router: TutorialRouting! { get set }
    var listener: TutorialListener! { get set }
    // swiftlint:enable implicitly_unwrapped_optional
}

protocol TutorialPresentable: Presentable {
    var listener: TutorialPresentableListener! { get set }
}

final class TutorialInteractor: PresentableInteractor<TutorialPresentable>, TutorialInteractable, TutorialPresentableListener {

    // swiftlint:disable implicitly_unwrapped_optional
    weak var rootViewController: UIViewController!
    weak var dependency: TutorialDependency!
    weak var router: TutorialRouting!
    weak var listener: TutorialListener!
    // swiftlint:enable implicitly_unwrapped_optional

    /// <aarkay TutorialInteractor>
    /// </aarkay>

    override init(presenter: TutorialPresentable) {
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

    func didDismissTutorial() {
        listener.didDismissTutorial()
    }

}
