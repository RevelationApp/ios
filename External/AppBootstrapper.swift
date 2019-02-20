//
//  AppService.swift
//  Revelation
//
//  Created by RahulKatariya on 20/02/19.
//  Copyright © 2019 RahulKatariya. All rights reserved.
//

import Foundation

public protocol BootstrapService {
    func bootstrap()
}

public class AppBootstrapper {
    private let service: BootstrapService
    private var lock = os_unfair_lock()
    private var setupCompleted: Bool = false
    
    public init(service: BootstrapService) {
        self.service = service
    }

    public func bootstrap() -> Bool {
        defer { os_unfair_lock_unlock(&lock) }
        os_unfair_lock_lock(&lock)
        if setupCompleted { return false }
        service.bootstrap()
        setupCompleted = true
        return true
    }
}
