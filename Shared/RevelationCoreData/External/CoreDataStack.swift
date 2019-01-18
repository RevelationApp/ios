//
//  CoreDataStack.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 29/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData

public class CoreDataStack {
    let name: String
    let bundle: Bundle
    let fileManager: FileManager

    init(
        name: String,
        bundle: Bundle = Bundle.main,
        fileManager: FileManager = FileManager.default
    ) {
        self.name = name
        self.bundle = bundle
        self.fileManager = fileManager
        #if DEBUG
        let sqlPath = storeUrl.path.replacingOccurrences(of: " ", with: "\\ ")
        print("sqlbrowser \(sqlPath)")
        #endif
    }

    lazy var storeUrl: URL = {
        let storePath = NSPersistentContainer.defaultDirectoryURL()
        return storePath.appendingPathComponent("\(name).sqlite")
    }()

    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = RevelationPC(name: name)
        return container
    }()

    lazy var viewContext: NSManagedObjectContext = {
        let vc = persistentContainer.viewContext
        vc.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        return vc
    }()

    // MARK: - Core Data Persistent Stores Setup

    func setup(completion: @escaping () -> Void) {
        self.persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                completion()
            }
        }
    }

    // MARK: - Core Data Background Child Context

    func newBackgroundContext() -> NSManagedObjectContext {
        return viewContext
    }
}
