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
    self.backgroundColor = .white

    addSubviews()
    constraint()
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

  @objc private func clickCalculateTipButton() {
    let amount = Double(billAmountField.text!)!
    let percentage = Double(tipPercentageField.text!)!
    tipAmountLabel.text = String(amount + amount * percentage / 100)
  }

  private func addSubviews() {
    addSubview(billAmountLabel)
    addSubview(billAmountField)
    addSubview(tipPercentageLabel)
    addSubview(tipPercentageField)
    addSubview(calculateTipButton)
    addSubview(tipAmountLabel)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      billAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      billAmountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),

      billAmountField.centerXAnchor.constraint(equalTo: centerXAnchor),
      billAmountField.topAnchor.constraint(equalTo: billAmountLabel.bottomAnchor, constant: 16),

      tipPercentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      tipPercentageLabel.topAnchor.constraint(equalTo: billAmountField.bottomAnchor, constant: 16),

      tipPercentageField.centerXAnchor.constraint(equalTo: centerXAnchor),
      tipPercentageField.topAnchor.constraint(equalTo: tipPercentageLabel.bottomAnchor, constant: 16),

      calculateTipButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      calculateTipButton.topAnchor.constraint(equalTo: tipPercentageField.bottomAnchor, constant: 16),

      tipAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      tipAmountLabel.topAnchor.constraint(equalTo: calculateTipButton.bottomAnchor, constant: 16),
    ])
  }

}
