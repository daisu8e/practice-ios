import UIKit

class AddTodoViewController: UIViewController {

  var model: AddTodoViewModel!

  init(todoList: TodoList) {
    self.model = AddTodoViewModel(todoList: todoList)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func loadView() {
    self.view = AddTodoView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Add Task"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
  }

  @objc func handleDoneButton() {
    guard let title = (view as! AddTodoView).titleField.text else { return }
    model.done(title: title)
    dismiss(animated: true, completion: nil)
  }

  @objc func handleCancelButton() {
    dismiss(animated: true, completion: nil)
  }

}
