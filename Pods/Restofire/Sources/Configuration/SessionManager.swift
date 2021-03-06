//
//  Session.swift
//  Restofire
//
//  Created by Rahul Katariya on 28/01/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import Foundation
import Alamofire

/// A Session for RESTful Services.
///
/// ```swift
/// Session.default.session = {
///     let sessionConfiguration = URLSessionConfiguration.default
///     sessionConfiguration.timeoutIntervalForRequest = 7
///     sessionConfiguration.timeoutIntervalForResource = 7
///     sessionConfiguration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
///     return Session(configuration: sessionConfiguration)
/// }
/// ```
public struct SessionManager {
    /// The default session manager.
    public static var `default` = SessionManager()

    /// The Alamofire Session. `Alamofire.Session(startRequestsImmediately: false)` by default.
    public var session = Session(startRequestsImmediately: false)

    /// `Session` Intializer
    ///
    /// - returns: new `Session` object
    public init() {}
}
