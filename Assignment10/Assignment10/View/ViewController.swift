import UIKit

class ViewController: UIViewController {

  @IBOutlet var colorDisplay: UIView!
  
  @IBOutlet var redSwitch: UISwitch!
  @IBOutlet var greenSwitch: UISwitch!
  @IBOutlet var blueSwitch: UISwitch!
  
  @IBOutlet var redSlider: UISlider!
  @IBOutlet var greenSlider: UISlider!
  @IBOutlet var blueSlider: UISlider!

  var model: ViewModel

  required init?(coder aDecoder: NSCoder) {
    self.model = ViewModel()
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    styleColorDisplay()
    renderSwitches()
    enableSliders()
    renderSliders()
    renderDisplay()
  }

  private func styleColorDisplay() {
    colorDisplay.layer.borderWidth = 5.0
    colorDisplay.layer.borderColor = UIColor.black.cgColor
    colorDisplay.layer.cornerRadius = 20
  }

  private func renderSwitches() {
    redSwitch.isOn = model.red.isOn
    greenSwitch.isOn = model.green.isOn
    blueSwitch.isOn = model.blue.isOn
  }

  private func enableSliders() {
    redSlider.isEnabled = model.red.isOn
    greenSlider.isEnabled = model.green.isOn
    blueSlider.isEnabled = model.blue.isOn
  }

  private func renderSliders() {
    redSlider.value = model.red.value
    greenSlider.value = model.green.value
    blueSlider.value = model.blue.value
  }

  private func renderDisplay() {
    colorDisplay.backgroundColor = model.getColor()
  }

  @IBAction func switchChanged(_ sender: UISwitch) {
    switch sender.tag {
    case 1: model.red.enable(sender.isOn)
    case 2: model.green.enable(sender.isOn)
    case 3: model.blue.enable(sender.isOn)
    default: break
    }
    enableSliders()
    renderDisplay()
  }

  @IBAction func sliderChanged(_ sender: UISlider) {
    switch sender.tag {
    case 1: model.red.update(sender.value)
    case 2: model.green.update(sender.value)
    case 3: model.blue.update(sender.value)
    default: break
    }
    renderDisplay()
  }
  
  @IBAction func resetButtonTapped(_ sender: UIButton) {
    model.reset()
    renderSwitches()
    enableSliders()
    renderSliders()
    renderDisplay()
  }
  
}

