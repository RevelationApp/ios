import RIBs

protocol LoggedInRouting: Routing {
    /// <aarkay LoggedInRouting>
    /// </aarkay>
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // swiftlint:disable implicitly_unwrapped_optional
    private var loggedInInteractor: LoggedInInteractable!
    // swiftlint:enable implicitly_unwrapped_optional

    override init(interactor: LoggedInInteractable) {
        self.loggedInInteractor = interactor
        super.init(interactor: interactor)
        interactor.router = self
    }

}
