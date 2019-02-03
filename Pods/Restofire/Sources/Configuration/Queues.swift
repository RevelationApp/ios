//
//  Queues.swift
//  Restofire
//
//  Created by RahulKatariya on 10/12/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import Foundation

/// A Queues for RESTful Services.
///
/// ```swift
/// var queues = Queues()
/// queues.completionQueue = DispatchQueue.main
/// ```
public struct Queues {
    
    /// The default queues.
    public static var `default` = Queues()
    
    /// The `completionQueue`.
    var completionQueue: DispatchQueue = DispatchQueue.main
    
    /// The `downloadProgressQueue`.
    var downloadProgressQueue: DispatchQueue = DispatchQueue.main
    
    /// The `uploadProgressQueue`.
    var uploadProgressQueue: DispatchQueue = DispatchQueue.main
    
    /// The request operation queue
    var requestQueue: OperationQueue = OperationQueue()
    
    /// The download operation queue
    var downloadQueue: OperationQueue = OperationQueue()
    
    /// The upload operation queue
    var uploadQueue: OperationQueue = OperationQueue()
    
}
