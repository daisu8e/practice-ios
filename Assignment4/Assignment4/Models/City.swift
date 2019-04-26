import Foundation

struct City {

  let name: String
  let country: String
  let weather: Weather
  let temperature: Double
  let icon: String
  let summary: String

  static private var kvs: [String: City] {
    return [
      "vancouver": City(name: "Vancouver", country: "Canada", weather: Weather.find("sunny"), temperature: 15.6, icon: "canada", summary: "Sunny"),
      "tokyo": City(name: "Tokyo", country: "Japan", weather: Weather.find("cloudy"), temperature: 20.3, icon: "japan", summary: "Hot"),
      "saoPaulo": City(name: "São Paulo", country: "Brazil", weather: Weather.find("rainy"), temperature: 26.8, icon: "brazil", summary: "Dangerous"),
      "venice": City(name: "Venice", country: "Italy", weather: Weather.find("windy"), temperature: 30.7, icon: "italy", summary: "Rainy"),
      "seoul": City(name: "Seoul", country: "Korea", weather: Weather.find("stormy"), temperature: 8.5, icon: "korea", summary: "Amazing"),
    ]
  }

  static func find(_ id: String) -> City {
    return kvs[id]!
  }

}
