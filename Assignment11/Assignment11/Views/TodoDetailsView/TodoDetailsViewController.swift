import UIKit

class TodoDetailsViewController: UIViewController, ViewObserver {

  var model: TodoDetailsViewModel!

  init(task: Task) {
    self.model = TodoDetailsViewModel(task: task)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func loadView() {
    self.view = TodoDetailsView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = model.task.title
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditButton))
  }

  @objc func handleEditButton() {
    present(EditTodoViewController(observer: self, task: model.task), animated: true)
  }

  func reload(_ data: Any) {
    model.task = data as! Task
    (view as! TodoDetailsView).render()
  }

}
