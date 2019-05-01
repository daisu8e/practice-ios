import UIKit

class MainView: UIView {

  let defaultTipPercentage = 15

  var ctrl: MainViewController!

  var billAmountLabel: UILabel!
  var billAmountField: UITextField!
  var tipPercentageLabel: UILabel!
  var tipPercentageField: UITextField!
  var calculateTipButton: UIButton!
  var tipAmountLabel: UILabel!
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

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(_ ctrl: MainViewController!) {
    super.init(frame: CGRect.zero)

    self.ctrl = ctrl
    self.billAmountLabel = createBillAmountLabel()
    self.billAmountField = createBillAmountField()
    self.tipPercentageLabel = createTipPercentageLabel()
    self.tipPercentageField = createTipPercentageField()
    self.calculateTipButton = createCalculateTipButton()
    self.tipAmountLabel = createTipAmountLabel()
    self.layout = createLayout()
    self.closeKeyboardButton = createCloseKeyboardButton()
    self.backgroundColor = .white

    addSubviews()
    constraint()
  }

  func enableKeyboardLayout(keyboard: CGRect, animation: TimeInterval) {
    closeKeyboardButton.isHidden = false
    UIView.animate(withDuration: animation, delay: 0, options: .curveLinear, animations: {
      self.constraintKeyboardLayout(with: keyboard)
      self.layoutIfNeeded()
    })
  }

  func disableKeyboardLayout(keyboard: CGRect, animation: TimeInterval) {
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
    it.text = String(defaultTipPercentage)
    return it
  }

  private func createCalculateTipButton() -> UIButton {
    let it = UIButton(type: .system)
    it.translatesAutoresizingMaskIntoConstraints = false
    it.setTitle("Calculate Tip", for: .normal)
    it.addTarget(self, action: #selector(clickCalculateTipButton), for: .touchUpInside)
    return it
  }

  private func createTipAmountLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Tip Amount"
    return it
  }

  private func createLayout() -> UIStackView {
    let it = UIStackView()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.addArrangedSubview(billAmountLabel)
    it.addArrangedSubview(billAmountField)
    it.addArrangedSubview(tipPercentageLabel)
    it.addArrangedSubview(tipPercentageField)
    it.addArrangedSubview(calculateTipButton)
    it.addArrangedSubview(tipAmountLabel)
    it.axis = .vertical
    it.distribution = .equalSpacing
    it.spacing = 16
    return it
  }

  private func createCloseKeyboardButton() -> UIButton {
    let it = UIButton(type: .system)
    it.translatesAutoresizingMaskIntoConstraints = false
    it.setTitle("Close", for: .normal)
    it.addTarget(self, action: #selector(clickCloseKeyboardButton), for: .touchUpInside)
    it.isHidden = true
    return it
  }

  @objc private func clickCalculateTipButton() {
    let amount = Double(billAmountField.text!)!
    let percentage = Double(tipPercentageField.text!)!
    tipAmountLabel.text = String(amount + amount * percentage / 100)
  }

  @objc private func clickCloseKeyboardButton() {
    endEditing(true)
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
