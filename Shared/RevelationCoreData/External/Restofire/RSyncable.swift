//
//  RSyncable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 18/01/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//

import Foundation
import Restofire

public protocol RSyncable {
    associatedtype Request: Requestable
    var request: Request { get }
    
    func shouldSync() throws -> Bool
    func insert(model: Request.Response) throws
}

extension RSyncable {
    
    public func shouldSync() throws -> Bool {
        return true
    }
    
    public func sync(completion: ((Error?) -> ())? = nil) {
        do {
            guard try self.shouldSync() else {
                DispatchQueue.main.async { completion?(nil) }
                return
            }
            try self.request.execute { result, response in
                guard let result = result else {
                    DispatchQueue.main.async { completion?(response.error!) }
                    return
                }
                do {
                    try self.insert(model: result)
                    DispatchQueue.main.async { completion?(nil) }
                } catch {
                    DispatchQueue.main.async { completion?(error) }
                }
            }
        } catch {
            DispatchQueue.main.async { completion?(error) }
        }
    }
    
}
