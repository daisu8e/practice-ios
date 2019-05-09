import UIKit

class AddTodoView: UIView {

  var ctrl: AddTodoViewController!

  var titleLabel: UILabel!
  var titleField: UITextField!
  var layout: UIStackView!

  init(_ ctrl: AddTodoViewController) {
    self.ctrl = ctrl
    super.init(frame: .zero)

    backgroundColor = .white

    self.titleLabel = createTitleLabel()
    self.titleField = createTitleField()
    self.layout = createLayout()

    addSubview(layout)

    NSLayoutConstraint.activate([
      layout.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
      layout.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      layout.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
    ])
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  private func createTitleLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Todo"
    it.font = UIFont.boldSystemFont(ofSize: 20)
    it.textColor = .black
    return it
  }

  private func createTitleField() -> UITextField {
    let it = UITextField(frame: .zero)
    it.translatesAutoresizingMaskIntoConstraints = false
    it.placeholder = "Something to do"
    return it
  }

  private func createLayout() -> UIStackView {
    let it = UIStackView(arrangedSubviews: [titleLabel, titleField])
    it.translatesAutoresizingMaskIntoConstraints = false
    it.axis = .vertical
    it.spacing = 16
    return it
  }

}
