//
//  RevelationAPISpec.swift
//  RevelationAPI
//
//  Created by Rahul Katariya on 04/10/16.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import Nimble
import Quick
@testable import RevelationAPI

class RevelationAPISpec: QuickSpec {
    let timeout: TimeInterval = 120
    let pollInterval: TimeInterval = 1

    override func spec() {
        super.spec()

        beforeSuite {
            RevelationAPI.setup(
                host: "api.themoviedb.org/3",
                apiKey: "c3d8a803a729d2f0e663816589397586",
                language: "en-US"
            )
        }
    }
}
