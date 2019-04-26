import UIKit

class FirstTableViewController: UITableViewController {

  var names:[String] = [
    "Derrick", "Tom", "Gui", "Kazuya", "Juan", "Hao-tse", "Paulo",
    "Scott", "Ayana", "Shota", "Masa", "Enrique", "Mihail", "Ozan",
    "Daisuke", "Danilo"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NameCell
    cell.label?.text = names[indexPath.row]
    return cell

  }
}
