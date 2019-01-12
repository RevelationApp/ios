//
//  Validatable.swift
//  Restofire
//
//  Created by Rahul Katariya on 23/04/16.
//  Copyright © 2016 Restofire. All rights reserved.
//

import Foundation
import Alamofire

/// Represents a `Validation` that is associated with `Requestable`.
public protocol Validatable {
    
    /// The `validation`.
    var validation: Validation { get }
    
}

extension Validatable where Self: Configurable {
    
    /// `Validation.default`
    public var validation: Validation {
        return Validation.default
    }
        
}
