//
//  Syncable.swift
//  Restofire
//
//  Created by RahulKatariya on 31/12/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import Foundation
import Restofire

public protocol RSyncable {
    associatedtype Request: Requestable
    var request: Request { get }
    
    func shouldSync(completion: (Bool) throws -> ()) throws
    func insert(model: Request.Response, completion: @escaping () throws -> ()) throws
}

extension RSyncable {
    
    public func shouldSync(completion: (Bool) throws -> ()) throws {
        try completion(true)
    }
    
    public func sync(completion: ((Error?) -> ())? = nil) {
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
                    do {
                        try self.insert(model: result) {
                            DispatchQueue.main.async { completion?(nil) }
                        }
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
