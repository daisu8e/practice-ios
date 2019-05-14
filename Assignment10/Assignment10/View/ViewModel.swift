import UIKit

class ViewModel {

  var red: Color
  var green: Color
  var blue: Color

  init() {
    self.red = Color("red")
    self.green = Color("green")
    self.blue = Color("blue")
  }

  func reset() {
    red.reset()
    green.reset()
    blue.reset()
  }

  func getColor() -> UIColor {
    let r: CGFloat = CGFloat(red.isOn ? red.value : 0)
    let g: CGFloat = CGFloat(green.isOn ? green.value : 0)
    let b: CGFloat = CGFloat(blue.isOn ? blue.value : 0)
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }

}
