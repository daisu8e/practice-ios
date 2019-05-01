import UIKit

class MainView: UIView {

  let defaultTipPercentage = 15

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
    self.tipPercentageSlider = createTipPercentageSlider()
    self.tipAmountLabel = createTipAmountLabel()
    self.tipAmountField = createTipAmountField()
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
    it.addTarget(self, action: #selector(changeBillAmountField), for: .editingChanged)
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
    it.addTarget(self, action: #selector(changeTipPercentageField), for: .editingChanged)
    return it
  }

  private func createTipPercentageSlider() -> UISlider {
    let it = UISlider()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.minimumValue = 0
    it.maximumValue = 100
    it.value = Float(defaultTipPercentage)
    it.addTarget(self, action: #selector(changeTipPercentageSlider), for: .valueChanged)
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
    it.addTarget(self, action: #selector(clickCloseKeyboardButton), for: .touchUpInside)
    it.isHidden = true
    return it
  }

  @objc private func changeBillAmountField() {
    updateTipAmount()
  }

  @objc private func clickCloseKeyboardButton() {
    endEditing(true)
  }

  @objc private func changeTipPercentageField() {
    let percentage = tipPercentageField.text!
    if percentage.isEmpty { return }
    tipPercentageSlider.value = Float(percentage)!
    updateTipAmount()
  }

  @objc private func changeTipPercentageSlider() {
    tipPercentageField.text = String(Int(tipPercentageSlider.value))
    updateTipAmount()
  }

  private func updateTipAmount() {
    let amount = billAmountField.text!
    let percentage = tipPercentageField.text!
    if amount.isEmpty || percentage.isEmpty { return }
    tipAmountField.text = String(Double(amount)! * Double(percentage)! / 100)
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
