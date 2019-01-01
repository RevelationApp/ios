//
//  FetchRequestListener.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 28/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData

class FetchRequestListener<T: NSFetchRequestResult>: NSObject, NSFetchedResultsControllerDelegate {
    let frc: NSFetchedResultsController<T>
    let listener: ([T]) -> Void

    init(
        request: NSFetchRequest<T>,
        context: NSManagedObjectContext,
        listener: @escaping ([T]) -> Void
    ) {
        self.frc = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        self.listener = listener
        super.init()
        self.frc.delegate = self
    }

    func controllerDidChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>
    ) {
        self.listener(self.frc.fetchedObjects!)
    }
}
