import UIKit

class TodoDetailsView: UIView {

  var ctrl: TodoDetailsViewController!

  var titleLabel: UILabel!
  var titleField: UILabel!
  var layout: UIStackView!

  init(_ ctrl: TodoDetailsViewController) {
    self.ctrl = ctrl
    super.init(frame: .zero)

    backgroundColor = .white

    self.titleLabel = createTitleLabe()
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

  private func createTitleLabe() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Todo"
    it.font = UIFont.boldSystemFont(ofSize: 20)
    it.textColor = .black
    return it
  }

  private func createTitleField() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = ctrl.model.todo.title
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
