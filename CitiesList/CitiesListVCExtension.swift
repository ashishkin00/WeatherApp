import CoreData
import UIKit

extension CitiesList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = appDelegate.fetchAllValuesInSection(key: "name", ascending: true) {
            if result.count > 0 {
                splashLabel.isHidden = true
            } else {
                splashLabel.isHidden = false
            }
            return result.count
        }
        splashLabel.isHidden = false
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.text = appDelegate.fetchAllValuesInSection(key: "name", ascending: true)![indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        show(CitySettingsVC())
    }
}
