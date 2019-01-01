//
//  CDDomainable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 29/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData

protocol CDDomainable: CDModelable {
    associatedtype DomainModel
    static func asDomain(item: CDModel) -> DomainModel
}

extension CDDomainable {
    static func fetch(
        context: NSManagedObjectContext,
        request: NSFetchRequest<CDModel>
    ) throws -> [DomainModel] {
        let results = try context.fetch(request)
        return results.map(asDomain)
    }

    static func all(context: NSManagedObjectContext) throws -> [DomainModel] {
        return try self.fetch(context: context, request: fetchRequest())
    }
}
