//
//  Syncable.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 30/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Restofire

public protocol Syncable {
    associatedtype Response
    associatedtype Request: Requestable where Request.Response == Response

    func request() -> Request
    func shouldSync(completion: (Bool) throws -> Void) throws
    func insert(model: Response, completion: @escaping () throws -> Void) throws
}

extension Syncable {
    public func shouldSync(completion: (Bool) throws -> Void) throws {
        try completion(true)
    }

    public func sync(completion: ((Error?) -> Void)? = nil) {
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
