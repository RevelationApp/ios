import RIBs

protocol SignUpDependency: Dependency {
    var appService: AppService { get }
}

final class SignUpComponent: Component<SignUpDependency>, TncDependency {

    var appService: AppService {
        return dependency.appService
    }

    let phoneNumber: String?

    init(dependency: SignUpDependency, phoneNumber: String?) {
        self.phoneNumber = phoneNumber
        super.init(dependency: dependency)
    }

}

protocol SignUpBuildable: Buildable {
    func build(with listener: SignUpListener, rootViewController: UIViewController, phoneNumber: String?) -> SignUpRouting
}

final class SignUpBuilder: Builder<SignUpDependency>, SignUpBuildable {

    func build(with listener: SignUpListener, rootViewController: UIViewController, phoneNumber: String?) -> SignUpRouting {
        let component = SignUpComponent(dependency: dependency, phoneNumber: phoneNumber)
        let tncBuilder = TncBuilder(dependency: component)
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignUpViewController
        viewController.phoneNumber = phoneNumber
        let interactor = SignUpInteractor(presenter: viewController)
        interactor.dependency = dependency
        interactor.listener = listener
        interactor.rootViewController = viewController
        return SignUpRouter(interactor: interactor, viewController: viewController, tncBuilder: tncBuilder)
    }

}
