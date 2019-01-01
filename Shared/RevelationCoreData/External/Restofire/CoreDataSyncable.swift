//
//  CoreDataSyncable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData
import Restofire

public protocol CoreDataSyncable: Syncable {
    var context: NSManagedObjectContext { get }
}

extension CoreDataSyncable {
    public func sync(completion: ((Error?) -> Void)? = nil) {
        self.context.perform {
            do {
                try self.shouldSync { flag in
                    guard flag else {
                        DispatchQueue.main.async { completion?(nil) }
                        return
                    }
                    try self.request().execute { result, response in
                        guard let result = result else {
                            DispatchQueue.main.async { completion?(response.error!) }
                            return
                        }
                        self.context.perform {
                            do {
                                try self.insert(model: result) {
                                    try self.context.performAndWait {
                                        try self.context.save()
                                    }
                                    DispatchQueue.main.async { completion?(nil) }
                                }
                            } catch {
                                DispatchQueue.main.async { completion?(error) }
                            }
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async { completion?(error) }
            }
        }
    }
}
