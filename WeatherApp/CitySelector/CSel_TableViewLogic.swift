import UIKit

extension CitySelector: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = appDelegate.fetchAllValuesInSection(key: "name", ascending: true) {
            if result.count > 0 {
                hideSplash(true)
                return result.count
            }
        }
        hideSplash(false)
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.textAlignment = .center
        cell.textLabel!.text = appDelegate.fetchAllValuesInSection(key: "name", ascending: true)![indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let text = tableView.cellForRow(at: indexPath)?.textLabel?.text {
            print(text)
            delegate2?.defaults.set(text, forKey: "cityName")
            delegate2?.cityName = text
            delegate2?.updateValues()
        }
    }
}
