import UIKit
import RxSwift
import RxCocoa

protocol TncPresentableListener: class {
    func didDismissTnc()
    /// <aarkay TncPresentableListener>
    /// </aarkay>
}

class TncViewController: UIViewController, TncPresentable {

    weak var listener: TncPresentableListener!
    var disposeBag = DisposeBag()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// <aarkay viewDidDisappear>
        /// </aarkay>
        if isMovingFromParentViewController {
            listener.didDismissTnc()
        }
    }

    /// <aarkay TncViewController>
    /// </aarkay>

}
