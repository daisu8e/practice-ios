import UIKit

class SecondViewController: UIViewController {

  @IBOutlet var phoneLablel: UILabel! {
    didSet {
      phoneLablel.text = phoneNumber
    }
  }

  var phoneNumber: String!

  override func viewDidLoad() {
    super.viewDidLoad()

  }

}
