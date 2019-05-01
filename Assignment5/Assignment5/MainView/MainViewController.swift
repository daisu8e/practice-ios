import UIKit

class MainViewController: UIViewController {

  override func loadView() {
    self.view = MainView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    observeNotifications()
  }

  private func observeNotifications() {
    let it = NotificationCenter.default
    it.addObserver(self, selector: #selector(whenKeyboardShows(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    it.addObserver(self, selector: #selector(whenKeyboardHides(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  @objc func whenKeyboardShows(_ notification: Notification) {
    let rect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
    let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey]
    (view as! MainView).enableKeyboardLayout(keyboard: rect as! CGRect, animation: duration as! TimeInterval)
  }

  @objc func whenKeyboardHides(_ notification: Notification) {
    let rect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
    let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey]
    (view as! MainView).disableKeyboardLayout(keyboard: rect as! CGRect, animation: duration as! TimeInterval)
  }
}
