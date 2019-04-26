import UIKit

class ViewController: UIViewController {

  @IBOutlet var phoneTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier {
      switch identifier {
      case "GoSecond":
        if let vc = segue.destination as? SecondViewController {
          vc.phoneNumber = phoneTextField.text
        }
      default: break
      }
    }
  }

  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    return true
  }

  @IBAction func goToSecondVC(_ sender: UIButton) {
//    let secondVC = SecondViewController()
//    secondVC.phoneLablel.text = phoneTextField.text
//    navigationController?.pushViewController(secondVC, animated: true)
  }
}
