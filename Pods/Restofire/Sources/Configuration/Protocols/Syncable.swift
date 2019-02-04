//
//  Syncable.swift
//  Restofire
//
//  Created by RahulKatariya on 31/12/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import Foundation

public protocol Syncable {
    associatedtype Request: Requestable
    var request: Request { get }
    
    func shouldSync() throws -> Bool
    func insert(model: Request.Response, completion: @escaping () throws -> ()) throws
}

extension Syncable {
    
    public func shouldSync() throws -> Bool {
        return true
    }
    
    public func sync(
        completionQueue: DispatchQueue = .main,
        completion: ((Error?) -> ())? = nil
    ) -> NetworkOperation<Request>? {
        do {
            let flag = try self.shouldSync()
            guard flag else {
                completionQueue.async { completion?(nil) }
                return nil
            }
            let operation = try self.request.execute { response in
                switch response.result {
                case .success(let value):
                    do {
                        try self.insert(model: value) {
                            completionQueue.async { completion?(nil) }
                        }
                    } catch {
                        completionQueue.async { completion?(error) }
                    }
                case .failure(let error):
                    completionQueue.async { completion?(error) }
                }
            }
            return operation
        } catch {
            completionQueue.async { completion?(error) }
            return nil
        }
    }
    
}
