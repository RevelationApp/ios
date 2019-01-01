// swift-tools-version:4.2
//
//  RevelationCoreData.swift
//  RevelationCoreData
//
//  Created by Rahul Katariya on 23/10/15.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "RevelationCoreData",
    products: [
        .library(
            name: "RevelationCoreData",
            targets: ["RevelationCoreData"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RevelationCoreData",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "RevelationCoreDataTests",
            dependencies: ["RevelationCoreData"],
            path: "Tests"
        )
    ]
)
