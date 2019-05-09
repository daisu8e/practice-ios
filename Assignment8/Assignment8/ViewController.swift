import UIKit

class ViewController: UITableViewController {

  let cellId = "cell"

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }

  private func getRepositories(username: String) {
    let url = URL(string: "https://api.github.com/users/\(username)/repos")
    let task = URLSession(configuration: .default).dataTask(with: url) {data, res, err in
      if let err = err {
        print("Error: ", err)
        return
      }

      if let data = data {
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print(json)
      }

    }
    task.resume()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = "Vancouver"
    return cell
  }
}
