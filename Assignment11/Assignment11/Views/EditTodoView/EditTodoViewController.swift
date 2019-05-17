import UIKit

class EditTodoViewController: UIViewController {

  var observer: ViewObserver!
  var model: EditTodoViewModel!

  init(observer: ViewObserver, task: Task) {
    self.observer = observer
    self.model = EditTodoViewModel(task: task)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func loadView() {
    self.view = EditTodoView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Edit Task"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
  }

  @objc func handleDoneButton() {
    guard let title = (view as! EditTodoView).titleField.text else { return }
    model.done(title: title)
    dismiss(animated: true, completion: nil)
    observer.reload(model.task)
  }

  @objc func handleCancelButton() {
    dismiss(animated: true, completion: nil)
  }

}
