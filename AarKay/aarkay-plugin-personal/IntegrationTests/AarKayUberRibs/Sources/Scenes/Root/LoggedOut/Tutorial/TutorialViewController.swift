import UIKit
import RxSwift
import RxCocoa

protocol TutorialPresentableListener: class {
    func didDismissTutorial()
    /// <aarkay TutorialPresentableListener>
    /// </aarkay>
}

class TutorialViewController: UIViewController, TutorialPresentable {

    weak var listener: TutorialPresentableListener!
    var disposeBag = DisposeBag()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// <aarkay viewDidDisappear>
        /// </aarkay>
        if isMovingFromParentViewController {
            listener.didDismissTutorial()
        }
    }

    /// <aarkay TutorialViewController>
    /// </aarkay>

}
