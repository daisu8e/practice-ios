import UIKit

class MainView: UIView {

  var ctrl: MainViewController!

  var billAmountLabel: UILabel!
  var billAmountField: UITextField!
  var tipPercentageLabel: UILabel!
  var tipPercentageField: UITextField!
  var tipPercentageSlider: UISlider!
  var tipAmountLabel: UILabel!
  var tipAmountField: UILabel!
  var layout: UIStackView!
  var closeKeyboardButton: UIButton!

  var animationConstraints: [NSLayoutConstraint] = [] {
    willSet {
      NSLayoutConstraint.deactivate(animationConstraints)
    }
    didSet {
      NSLayoutConstraint.activate(animationConstraints)
    }
  }

  init(_ ctrl: MainViewController!) {
    super.init(frame: CGRect.zero)

    self.ctrl = ctrl
    self.billAmountLabel = createBillAmountLabel()
    self.billAmountField = createBillAmountField()
    self.tipPercentageLabel = createTipPercentageLabel()
    self.tipPercentageField = createTipPercentageField()
    self.tipPercentageSlider = createTipPercentageSlider()
    self.tipAmountLabel = createTipAmountLabel()
    self.tipAmountField = createTipAmountField()
    self.layout = createLayout()
    self.closeKeyboardButton = createCloseKeyboardButton()
    self.backgroundColor = .white

    addSubviews()
    constraint()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  func renderTipPercentageField() {
    tipPercentageField.text = String(ctrl.model.tipPercentage)
  }

  func renderTipPercentageSlider() {
    tipPercentageSlider.value = Float(ctrl.model.tipPercentage)
  }

  func renderTipAmountField() {
    tipAmountField.text = String(ctrl.model.tipAmount)
  }

  func renderKeyboardLayout(keyboard: CGRect, animation: TimeInterval) {
    closeKeyboardButton.isHidden = false
    UIView.animate(withDuration: animation, delay: 0, options: .curveLinear, animations: {
      self.constraintKeyboardLayout(with: keyboard)
      self.layoutIfNeeded()
    })
  }

  func renderDefaultLayout(keyboard: CGRect, animation: TimeInterval) {
    closeKeyboardButton.isHidden = true
    UIView.animate(withDuration: animation, delay: 0, options: .curveLinear, animations: {
      self.constraintDefaultLayout()
      self.layoutIfNeeded()
    })
  }

  private func createBillAmountLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Bill Amount"
    return it
  }

  private func createBillAmountField() -> UITextField {
    let it = UITextField()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.placeholder = "Enter Bill Amount"
    it.keyboardType = .decimalPad
    it.addTarget(ctrl, action: #selector(MainViewController.whenBillAmountFieldChanged), for: .editingChanged)
    return it
  }

  private func createTipPercentageLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Tip Percentage"
    return it
  }

  private func createTipPercentageField() -> UITextField {
    let it = UITextField()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.placeholder = "Enter Tip Percentage"
    it.keyboardType = .decimalPad
    it.text = String(ctrl.model.tipPercentage)
    it.addTarget(ctrl, action: #selector(MainViewController.whenTipPercentageFieldChanged), for: .editingChanged)
    return it
  }

  private func createTipPercentageSlider() -> UISlider {
    let it = UISlider()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.minimumValue = 0
    it.maximumValue = 100
    it.value = Float(ctrl.model.tipPercentage)
    it.addTarget(ctrl, action: #selector(MainViewController.whenTipPercentageSliderChanged), for: .valueChanged)
    return it
  }

  private func createTipAmountLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Tip Amount"
    return it
  }

  private func createTipAmountField() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "0"
    return it
  }

  private func createLayout() -> UIStackView {
    let it = UIStackView()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.addArrangedSubview(billAmountLabel)
    it.addArrangedSubview(billAmountField)
    it.addArrangedSubview(tipPercentageLabel)
    it.addArrangedSubview(tipPercentageField)
    it.addArrangedSubview(tipPercentageSlider)
    it.addArrangedSubview(tipAmountLabel)
    it.addArrangedSubview(tipAmountField)
    it.axis = .vertical
    it.distribution = .equalSpacing
    it.spacing = 16
    return it
  }

  private func createCloseKeyboardButton() -> UIButton {
    let it = UIButton(type: .system)
    it.translatesAutoresizingMaskIntoConstraints = false
    it.setTitle("Close", for: .normal)
    it.addTarget(ctrl, action: #selector(MainViewController.whenCloseKeyboardButtonClicked), for: .touchUpInside)
    it.isHidden = true
    return it
  }

  private func addSubviews() {
    addSubview(layout)
    addSubview(closeKeyboardButton)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      layout.centerXAnchor.constraint(equalTo: centerXAnchor),
      closeKeyboardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
    constraintDefaultLayout()
  }

  private func constraintDefaultLayout() {
    animationConstraints = [
      layout.centerYAnchor.constraint(equalTo: centerYAnchor),
      closeKeyboardButton.bottomAnchor.constraint(equalTo: bottomAnchor),
    ]
  }

  private func constraintKeyboardLayout(with keyboard: CGRect) {
    animationConstraints = [
      layout.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(keyboard.height / 2)),
      closeKeyboardButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -keyboard.height),
    ]
  }
}
