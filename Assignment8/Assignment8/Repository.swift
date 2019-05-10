import Foundation

class Repository: Decodable {
  let id: Int
  let name: String
  let full_name: String
  let clone_url: String
  let created_at: Date
  let updated_at: Date
}
