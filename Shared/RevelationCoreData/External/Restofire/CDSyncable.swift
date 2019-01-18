//
//  CDSyncable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 18/01/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//
/*
import Foundation
import CoreData

public protocol CDSyncable: RSyncable {
    var context: NSManagedObjectContext { get }
}

extension CDSyncable {
    
    public func sync(completion: ((Error?) -> ())? = nil) {
        self.context.perform {
            do {
                try self.shouldSync() { flag in
                    guard flag else {
                        DispatchQueue.main.async { completion?(nil) }
                        return
                    }
                    try self.request.execute { result, response in
                        guard let result = result else {
                            DispatchQueue.main.async { completion?(response.error!) }
                            return
                        }
                        self.context.perform {
                            do {
                                try self.insert(model: result) {
                                    self.context.perform {
                                        do {
                                            try self.context.save()
                                            DispatchQueue.main.async { completion?(nil) }
                                        } catch {
                                            DispatchQueue.main.async { completion?(error) }
                                        }
                                    }
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
*/
