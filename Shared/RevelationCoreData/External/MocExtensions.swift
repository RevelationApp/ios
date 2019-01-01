//
//  MocExtensions.swift
//  RevelationCoreData
//
//  Created by RahulKatariya on 30/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func performAndWait<T>(_ block: () throws -> T) rethrows -> T {
        return try self._throwHelper(
            fn: self.performAndWait, execute: block, rescue: { throw $0 }
        )
    }

    /// Helper function for convincing the type checker that
    /// the rethrows invariant holds for performAndWait.
    ///
    /// Source: https://github.com/apple/swift/blob/bb157a070ec6534e4b534456d208b03adc07704b/stdlib/public/SDK/Dispatch/Queue.swift#L228-L249
    private func _throwHelper<T>(
        fn: (() -> Void) -> Void,
        execute work: () throws -> T,
        rescue: ((Error) throws -> T)
    ) rethrows -> T {
        var result: T?
        var error: Error?
        withoutActuallyEscaping(work) { _work in
            fn {
                do {
                    result = try _work()
                } catch let e {
                    error = e
                }
            }
        }
        if let e = error {
            return try rescue(e)
        } else {
            return result!
        }
    }
}