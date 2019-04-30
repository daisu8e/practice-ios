import Foundation

struct Search: Decodable {
  let resultCount: Int
  let results: [App]
}
