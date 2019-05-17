import Foundation

class EditTodoViewModel {

  var task: Task

  init(task: Task) {
    self.task = task
  }

  func done(title: String) {
    task.title = title
    task.save()
  }

}
