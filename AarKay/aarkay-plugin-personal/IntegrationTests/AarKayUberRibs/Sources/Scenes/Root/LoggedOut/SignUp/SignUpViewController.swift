import UIKit
import RxSwift
import RxCocoa

protocol SignUpPresentableListener: class {
    func didDismissSignUp()
    /// <aarkay SignUpPresentableListener>
    /// </aarkay>
}

class SignUpViewController: UIViewController, SignUpPresentable {

    var phoneNumber: String?

    weak var listener: SignUpPresentableListener!
    var disposeBag = DisposeBag()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// <aarkay viewDidDisappear>
        /// </aarkay>
        if isMovingFromParentViewController {
            listener.didDismissSignUp()
        }
    }

    /// <aarkay SignUpViewController>
    /// </aarkay>

}
