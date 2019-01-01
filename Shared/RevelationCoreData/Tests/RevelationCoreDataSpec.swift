//
//  RevelationCoreDataSpec.swift
//  RevelationCoreData
//
//  Created by Rahul Katariya on 04/10/16.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import Nimble
import Quick
@testable import RevelationCoreData

class RevelationCoreDataSpec: QuickSpec {
    override func spec() {
        describe("RevelationCoreDataSpec") {
            it("works") {
                expect(RevelationCoreData.name) == "RevelationCoreData"
            }
        }
    }
}
