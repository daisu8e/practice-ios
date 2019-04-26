import UIKit

class WhiteViewController: UIViewController, UISplitViewControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    splitViewController?.delegate = self
  }

  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
    return true
  }
}
