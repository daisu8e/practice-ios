import UIKit

class EditTodoView: UIView {

  var ctrl: EditTodoViewController!

  var navigationBar: UINavigationBar!
  var titleLabel: UILabel!
  var titleField: UITextField!
  var layout: UIStackView!

  init(_ ctrl: EditTodoViewController) {
    self.ctrl = ctrl
    super.init(frame: .zero)

    backgroundColor = .white

    self.navigationBar = createNavigationBar()
    self.titleLabel = createTitleLabel()
    self.titleField = createTitleField()
    self.layout = createLayout()

    addSubview(navigationBar)
    addSubview(layout)

    NSLayoutConstraint.activate([
      navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
      navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),

      layout.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 16),
      layout.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      layout.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
    ])
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  private func createNavigationBar() -> UINavigationBar {
    let it = UINavigationBar()
    let navigationItem = UINavigationItem(title: "Edit Task")
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: ctrl, action: #selector(EditTodoViewController.handleCancelButton))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: ctrl, action: #selector(EditTodoViewController.handleDoneButton))
    it.setItems([navigationItem], animated: false)
    it.translatesAutoresizingMaskIntoConstraints = false
    return it
  }

  private func createTitleLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    it.text = "Task"
    it.font = UIFont.boldSystemFont(ofSize: 20)
    it.textColor = .black
    return it
  }

  private func createTitleField() -> UITextField {
    let it = UITextField(frame: .zero)
    it.translatesAutoresizingMaskIntoConstraints = false
    it.placeholder = "Something to do"
    it.text = ctrl.model.task.title
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
