import UIKit

class TodoListViewController: UITableViewController {

  let cellId = "todo-list-cell"

  var model: TodoListViewModel!

  init(todoList: TodoList) {
    self.model = TodoListViewModel(todoList: todoList)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

//    tableView.delegate = self
//    tableView.dataSource = self
    tableView.register(TodoListCell.self, forCellReuseIdentifier: cellId)

    navigationItem.rightBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))

    tableView.allowsMultipleSelectionDuringEditing = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.todoList.data.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoListCell
    cell.titleLabel.text = model.todoList.get(indexPath.row).title
    return cell
  }

//  override func setEditing(_ editing: Bool, animated: Bool) {
//    super.setEditing(editing, animated: animated)
//    tableView.setEditing(editing, animated: animated)
//  }

  @objc func handleAddButton() {
    navigationController?.pushViewController(AddTodoViewController(todoList: model.todoList), animated: true)
  }

}

extension TodoListViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .insert:
      break
    case .delete:
      break
    default:
      break
    }
  }

  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return super.tableView(tableView, canMoveRowAt: indexPath)
  }

  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

  }

}

