import UIKit

class ViewController: UIViewController {

  @IBOutlet var colorView: UIView!
  @IBOutlet var redSwitch: UISwitch!
  @IBOutlet var greenSwitch: UISwitch!
  @IBOutlet var blueSwitch: UISwitch!
  @IBOutlet var redSlider: UISlider!
  @IBOutlet var greenSlider: UISlider!
  @IBOutlet var blueSlider: UISlider!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    updateControls()
    updateColor()
  }

  fileprivate func updateControls() {
    redSlider.isEnabled = redSwitch.isOn
    greenSlider.isEnabled = greenSwitch.isOn
    blueSlider.isEnabled = blueSwitch.isOn
  }

  fileprivate func updateColor() {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    if redSwitch.isOn { red = CGFloat(redSlider.value) }
    if greenSwitch.isOn { green = CGFloat(greenSlider.value) }
    if blueSwitch.isOn { blue = CGFloat(blueSlider.value) }
    colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }

  @IBAction func switchChanged(_ sender: UISwitch) {
    if sender.isOn {
      colorView.backgroundColor = UIColor.red
    } else {
      colorView.backgroundColor = UIColor.black
    }
  }

  @IBAction func sliderChanged(_ sender: UISlider) {
  }
    
  @IBAction func reset(_ sender: UIButton) {
    redSlider.value = 1
    greenSlider.value = 1
    blueSlider.value = 1

    redSwitch.isOn = false
    greenSwitch.isOn = false
    blueSwitch.isOn = false

    updateControls()
    updateColor()
  }
}
