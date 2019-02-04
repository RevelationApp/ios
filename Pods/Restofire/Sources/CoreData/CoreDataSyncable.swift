//
//  CoreDataSyncable.swift
//  Restofire
//
//  Created by RahulKatariya on 27/12/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import CoreData

public protocol CoreDataSyncable: Syncable {
    var context: NSManagedObjectContext { get }
}

extension CoreDataSyncable {
    
    public func sync(
        completionQueue: DispatchQueue = .main,
        completion: ((Error?) -> ())? = nil
    ) -> NetworkOperation<Request>? {
        var networkOperation: NetworkOperation<Request>? = nil
        self.context.performAndWait {
            do {
                let flag = try self.shouldSync()
                guard flag else {
                    completionQueue.async { completion?(nil) }
                    return
                }
                networkOperation = try self.request.operation() { response in
                    switch response.result {
                    case .success(let value):
                        self.context.perform {
                            do {
                                try self.insert(model: value) {
                                    if let operation = networkOperation,
                                        operation.isCancelled {
                                        return
                                    }
                                    self.context.perform {
                                        do {
                                            try self.context.save()
                                            completionQueue.async { completion?(nil) }
                                        } catch {
                                            completionQueue.async { completion?(error) }
                                        }
                                    }
                                }
                            } catch {
                                completionQueue.async { completion?(error) }
                            }
                        }
                    case .failure(let error):
                        completionQueue.async { completion?(error) }
                    }
                }
                networkOperation?.start()
            } catch {
                completionQueue.async { completion?(error) }
            }
        }
        return networkOperation
    }
    
}
