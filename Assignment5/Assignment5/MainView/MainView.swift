import UIKit

class MainView: UIView {

  var ctrl: MainViewController!
  var billAmountLabel: UILabel!
  var billAmountField: UITextField!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(_ ctrl: MainViewController!) {
    super.init(frame: CGRect.zero)

    self.backgroundColor = .white
    self.ctrl = ctrl
    self.billAmountLabel = createBillAmountLabel()
    self.billAmountField = createBillAmountField()

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

  private func addSubviews() {
    addSubview(billAmountLabel)
    addSubview(billAmountField)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      billAmountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      billAmountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),

      billAmountField.centerXAnchor.constraint(equalTo: centerXAnchor),
      billAmountField.topAnchor.constraint(equalTo: billAmountLabel.bottomAnchor, constant: 16),
    ])
  }

}
