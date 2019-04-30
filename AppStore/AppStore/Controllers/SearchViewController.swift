import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  private let cellId = "resultCell"

  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.backgroundColor = .white
    collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: cellId)

    fetchSearchResults()
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 300)
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCollectionViewCell
//    cell.contentView.backgroundColor = .red
    return cell
  }

  private func fetchSearchResults() {
    let urlString = "https://itunes.apple.com/search?term=instagram&country=JP&entity=software"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let err = error {
        print("Failed to fetch apps: ", err)
        return
      }

      guard let data = data else { return }

      do {

        let json = try JSONDecoder().decode(Search.self, from: data)
        json.results.forEach {
          print($0.trackName, $0.primaryGenreName)
        }

      } catch {
        print("Failed to decode JSON: ", error)
      }

    }.resume()
  }

}
