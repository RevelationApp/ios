import RevelationDomain
import UIKit

public class TvTableView: UITableView {
    public var collection: [Tv] = []

    init() {
        super.init(frame: .zero, style: .plain)
        self.initTvTableView()
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.initTvTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initTvTableView()
    }

    func initTvTableView() {
        /// <aarkay initTvTableView>
        register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        dataSource = self
        delegate = self
        /// </aarkay>
    }
}

/// AarKayEnd :-
extension TvTableView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collection.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = collection[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}
