import UIKit
import RxSwift
import RxCocoa

protocol LogInPresentableListener: class {
    func didDismissLogIn()
    /// <aarkay LogInPresentableListener>
    /// </aarkay>
}

class LogInViewController: UIViewController, LogInPresentable {

    weak var listener: LogInPresentableListener!
    var disposeBag = DisposeBag()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// <aarkay viewDidDisappear>
        /// </aarkay>
        if isMovingFromParentViewController {
            listener.didDismissLogIn()
        }
    }

    /// <aarkay LogInViewController>
    /// </aarkay>

}
