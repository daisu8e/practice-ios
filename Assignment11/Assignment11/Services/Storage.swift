import Foundation
import CoreData

class Storage {

  static let instance = Storage()

  lazy var context: NSManagedObjectContext = {
    let container = NSPersistentContainer(name: "Assignment11")
    container.loadPersistentStores { storeDescription, error in
      if let error = error as NSError? {
        print(error)
      }
    }
    return container.viewContext
  }()

  private init() {}

  func fetch(_ entity: String) -> [Any] {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
    do {
      return try context.fetch(request)
    } catch {
      print(error)
      return []
    }
  }

  func save() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        print(error)
      }
    }
  }

  func clear(_ entity: String) {
    let request = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: entity))
    do {
      try context.execute(request)
    } catch {
      print(error)
    }
  }

  func delete(_ object: NSManagedObject) {
    context.delete(object)
    save()
  }

}
