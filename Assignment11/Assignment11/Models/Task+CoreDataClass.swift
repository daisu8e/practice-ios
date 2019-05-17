import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {

  convenience init(title: String) {
    self.init(entity: NSEntityDescription.entity(forEntityName: "Task", in: Storage.instance.context)!, insertInto: Storage.instance.context)

    self.title = title
  }

  func complete() {
    isCompleted = true
    save()
  }

  func save() {
    Storage.instance.save()
  }

  func delete() {
    Storage.instance.delete(self)
  }

  class func list() -> [Task] {
    return Storage.instance.fetch("Task") as! [Task]
  }

  class func deleteAll() {
    Storage.instance.clear("Task")
  }

}
