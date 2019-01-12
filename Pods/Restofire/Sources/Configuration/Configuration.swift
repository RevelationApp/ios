//
//  Configuration.swift
//  Restofire
//
//  Created by Rahul Katariya on 24/03/16.
//  Copyright © 2016 Restofire. All rights reserved.
//

import Foundation
import Alamofire

/// A Configuration for RESTful Services. You must provide a `host`.
///
/// ```swift
/// var configuration = Configuration()
/// configuration.scheme: String = "https://"
/// configuration.baseURL = "www.mocky.io"
/// configuration.version = "v2"
/// configuration.headers = ["Content-Type": "application/json"]
/// ```
public struct Configuration {
    
    /// The default configuration.
    public static var `default` = Configuration()
    
    /// The scheme. `https://` by default.
    public var scheme: String = "https://"
    
    /// The host. `nil` by default.
    public var host: String!
    
    /// The version. `nil` by default.
    public var version: String?
    
    /// The url request parameters. `nil` by default.
    public var queryParameters: [String: Any]?
    
    /// The HTTP Method. `.GET` by default.
    public var method: HTTPMethod = .get
    
    /// The request parameter encoding. `.JSON` by default.
    public var encoding: ParameterEncoding = JSONEncoding.default
    
    /// The HTTP headers. `nil` by default.
    public var headers: HTTPHeaders = [:]
    
    /// The request delegates. `empty` by default.
    public var requestDelegates: [RequestDelegate] = []
    
    /// The request operation queue priority. `normal` by default.
    public var operationQueuePriority: Operation.QueuePriority = .normal
    
    /// `Configuration` Intializer
    ///
    /// - returns: new `Configuration` object
    public init() {}
}
