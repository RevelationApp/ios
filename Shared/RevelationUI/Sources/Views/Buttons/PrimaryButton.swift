import UIKit
import RxSwift
import RxCocoa

public class PrimaryButtonComponent {
    public init() {}
}

public class PrimaryButtonBuilder {
    public static func build(with component: PrimaryButtonComponent) -> PrimaryButton {
        let primaryButton = PrimaryButton()
        primaryButton.component = component
        return primaryButton
    }
}

public class PrimaryButton: UIButton {
    var disposeBag = DisposeBag()
    var component: PrimaryButtonComponent!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initPrimaryButton()
    }

    func initPrimaryButton() {
        /// <aarkay initPrimaryButton>

        /// </aarkay>
    }
}
