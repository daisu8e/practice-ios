import UIKit

class MainViewController: UIViewController {

  var model: MainViewModel!

  init() {
    self.model = MainViewModel()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

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
    (view as! MainView).renderKeyboardLayout(keyboard: rect as! CGRect, animation: duration as! TimeInterval)
  }

  @objc func whenKeyboardHides(_ notification: Notification) {
    let rect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
    let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey]
    (view as! MainView).renderDefaultLayout(keyboard: rect as! CGRect, animation: duration as! TimeInterval)
  }

  @objc func whenBillAmountFieldChanged() {
    let view = self.view as! MainView
    let field = view.billAmountField.text!
    if field.isEmpty { return }
    model.update(billAmount: Double(field)!)
    view.renderTipAmountField()
  }

  @objc func whenTipPercentageFieldChanged() {
    let view = self.view as! MainView
    let field = view.tipPercentageField.text!
    if field.isEmpty { return }
    model.update(tipPercentage: Int(field)!)
    view.renderTipPercentageSlider()
    view.renderTipAmountField()
  }

  @objc func whenTipPercentageSliderChanged() {
    let view = self.view as! MainView
    let slider = view.tipPercentageSlider.value
    model.update(tipPercentage: Int(slider))
    view.renderTipPercentageField()
    view.renderTipAmountField()
  }

  @objc func whenCloseKeyboardButtonClicked() {
    view.endEditing(true)
  }

}
