import Foundation

class Color {

  let userDefaults = UserDefaults.standard
  let name: String

  var isOn: Bool
  var value: Float

  init(_ name: String) {
    self.name = name
    self.isOn = userDefaults.object(forKey: "\(name).isOn") as? Bool ?? true
    self.value = userDefaults.object(forKey: "\(name).value") as? Float ?? 0
  }

  func reset() {
    isOn = true
    value = 0
  }

  func enable(_ isOn: Bool) {
    self.isOn = isOn
    userDefaults.set(self.isOn, forKey: "\(name).isOn")
  }

  func update(_ value: Float) {
    self.value = value
    userDefaults.set(self.value, forKey: "\(name).value")
  }

}
