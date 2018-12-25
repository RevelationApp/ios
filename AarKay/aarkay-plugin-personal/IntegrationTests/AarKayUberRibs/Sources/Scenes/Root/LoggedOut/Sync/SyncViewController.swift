import UIKit
import RxSwift
import RxCocoa

protocol SyncPresentableListener: class {
    func didDismissSync()
    /// <aarkay SyncPresentableListener>
    /// </aarkay>
}

class SyncViewController: UIViewController, SyncPresentable {

    weak var listener: SyncPresentableListener!
    var disposeBag = DisposeBag()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /// <aarkay viewDidDisappear>
        /// </aarkay>
        if isMovingFromParentViewController {
            listener.didDismissSync()
        }
    }

    /// <aarkay SyncViewController>
    /// </aarkay>

}
