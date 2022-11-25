import UIKit

extension CitiesList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.fetchAllNames(ascending: true).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = appDelegate.fetchAllNames(ascending: true)[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let name = tableView.cellForRow(at: indexPath)?.textLabel?.text {
            present(CitySettings(name: name))
        }
    }
}
