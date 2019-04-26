import Foundation

struct Weather {

  let image: String
  let description: String

  static private var kvs: [String: Weather] {
    return [
      "sunny": Weather(image: "🌞", description: "Sunny"),
      "cloudy": Weather(image: "☁️", description: "Cloudy"),
      "rainy": Weather(image: "☔️", description: "Rainy"),
      "windy": Weather(image: "🌬", description: "Windy"),
      "stormy": Weather(image: "⚡️", description: "Stormy"),
      "snowy": Weather(image: "☃️", description: "Snowy"),
    ]
  }

  static func find(_ id: String) -> Weather {
    return kvs[id]!
  }

}
