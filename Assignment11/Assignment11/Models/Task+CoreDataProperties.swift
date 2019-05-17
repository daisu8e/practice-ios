//
//  Task+CoreDataProperties.swift
//  Assignment11
//
//  Created by Daisuke Katsumata on 2019/05/16.
//  Copyright © 2019 kat8n. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var priority: Int32
    @NSManaged public var isCompleted: Bool
    @NSManaged public var details: String?

}
