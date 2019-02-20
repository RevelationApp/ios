import RevelationDomain
import RxCocoa
import RxSwift
import UIKit

public class MovieTableViewComponent {
    let items: [Movie]

    public init(
        items: [Movie]
    ) {
        self.items = items
    }
}

public class MovieTableViewBuilder {
    public static func build(with component: MovieTableViewComponent) -> MovieTableView {
        let movieTableView = MovieTableView(component: component)
        return movieTableView
    }
}

public class MovieTableView: UITableView {
    let component: MovieTableViewComponent

    init(component: MovieTableViewComponent) {
        self.component = component
        super.init(frame: .zero, style: .plain)
        self.initMovieTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initMovieTableView() {
        /// <aarkay initMovieTableView>
        register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        dataSource = self
        delegate = self
        /// </aarkay>
    }
}

/// AarKayEnd :-
extension MovieTableView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.component.items.count
    }

    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "UITableViewCell",
            for: indexPath
        )
        let item = component.items[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
}
