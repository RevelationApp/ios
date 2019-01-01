//
//  CoreDataFetchable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData

protocol CDModelable: class {
    associatedtype CDModel: NSManagedObject
}

extension CDModelable {
    static func fetchRequest() -> NSFetchRequest<CDModel> {
        let entity = CDModel.entity().name!
        let request: NSFetchRequest<CDModel> = NSFetchRequest(entityName: entity)
        request.sortDescriptors = []
        return request
    }

    static func count(
        context: NSManagedObjectContext,
        predicate: NSPredicate? = nil
    ) throws -> Int {
        let request = fetchRequest()
        request.includesSubentities = false
        request.predicate = predicate
        return try context.count(for: request)
    }

    static func fetch(
        context: NSManagedObjectContext,
        predicate: NSPredicate? = nil
    ) throws -> [CDModel] {
        let request = fetchRequest()
        request.predicate = predicate
        return try context.fetch(request)
    }
}
