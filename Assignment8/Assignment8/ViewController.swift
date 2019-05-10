import UIKit

class ViewController: UITableViewController {

  private let cellId = "cell"
  private let usernames: [String] = ["apple", "google", "facebook", "amazon"]
  private var repositories: [Repository] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.refreshControl = UIRefreshControl()
    tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)

    renderRepositories()
  }

  @objc func handleRefreshControl() {
    renderRepositories()
  }

  private func renderRepositories() {
    fetchRepositories(username: getUsername(), ok: { data in self.render(data) }, ng: { error in self.log(error) })
  }

  private func getUsername() -> String {
    let it = usernames.randomElement()!
    navigationItem.title = it
    return it
  }

  private func fetchRepositories(username: String, ok: @escaping (_ data: Data) -> Void, ng: @escaping (_ error: Error) -> Void) {
    guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else { return }
    let task = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
      self.tableView.refreshControl?.endRefreshing()
      if let error = error { ng(error) }
      else if let data = data { ok(data) }
    }
    task.resume()
  }

  private func render(_ data: Data) {
    do {
      self.repositories = try getJSONDecoder().decode([Repository].self, from: data)
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    } catch {
      log(error)
    }
  }

  private func getJSONDecoder() -> JSONDecoder {
    let it = JSONDecoder()
    it.dateDecodingStrategy = .iso8601
    return it
  }

  private func log(_ error: Error) {
    print("Error: ", error)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositories.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
    cell.textLabel?.text = repositories[indexPath.row].name
    cell.detailTextLabel?.text = repositories[indexPath.row].created_at.description
    return cell
  }
}
