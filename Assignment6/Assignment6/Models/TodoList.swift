import Foundation

class TodoList {

  var data: [Todo]

  init(_ data: Todo ...) {
    self.data = data
  }

  func get(_ index: Int) -> Todo {
    return data[index]
  }

  func add(_ todo: Todo) {
    data.append(todo)
  }

  func remove(_ index: Int) {
    data.remove(at: index)
  }

}
