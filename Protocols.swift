import UIKit

protocol GenericTableView {
    var tableView: UITableView { get set }
    var delegate: GenericTableView? { get set }
}

extension GenericTableView {
    func reloadTableData() {
        tableView.reloadData()
        print("table data reloaded")
    }
}
