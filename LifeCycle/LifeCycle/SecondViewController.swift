import UIKit

class SecondViewController: UIViewController {

  override func loadView() {
    super.loadView()
    print("SecongController#loadView")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("SecongController#viewDidLoad")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("SecongController#viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("SecongController#viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("SecongController#viewWillDisappear")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("SecongController#viewDidDisappear")
  }
}
