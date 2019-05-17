import Foundation

class TodoList {

  var data: [Task]

  init() {
    self.data = Task.list()
  }

  func get(_ index: Int) -> Task {
    return data[index]
  }

  func add(_ task: Task) {
    task.save()
    data.append(task)
  }

  func remove(_ index: Int) {
    let task = data[index]
    task.delete()
    data.remove(at: index)
  }

}
