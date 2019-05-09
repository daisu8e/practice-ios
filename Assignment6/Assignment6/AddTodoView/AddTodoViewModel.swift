import Foundation

class AddTodoViewModel {

  var todoList: TodoList

  init(todoList: TodoList) {
    self.todoList = todoList
  }

  func done(title: String) {
    todoList.add(Todo(title: title))
  }

}
