import UIKit

class TodoDetailsViewController: UIViewController {

  var model: TodoDetailsViewModel!

  init(todo: Todo) {
    self.model = TodoDetailsViewModel(todo: todo)
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

    navigationItem.title = model.todo.title
  }
    
}
