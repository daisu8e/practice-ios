import Foundation

class NetworkService {
  static let singleton = NetworkService()

  private init() {}

  func fetchSearchResults(searchTerm: String, completion: @escaping ([App], Error?) -> ()) {
    let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&country=JP&entity=software"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let err = error {
        print("Failed to fetch apps: ", err)
        completion([], err)
        return
      }

      guard let data = data else { return }

      do {

        let json = try JSONDecoder().decode(Search.self, from: data)

        completion(json.results, nil)

      } catch {
        print("Failed to decode JSON: ", error)
        completion([], error)
      }

    }.resume()
  }

}
