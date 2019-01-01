// swift-tools-version:4.2
//
//  RevelationDomain.swift
//  RevelationDomain
//
//  Created by Rahul Katariya on 23/10/15.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "RevelationDomain",
    products: [
        .library(
            name: "RevelationDomain",
            targets: ["RevelationDomain"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RevelationDomain",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "RevelationDomainTests",
            dependencies: ["RevelationDomain"],
            path: "Tests"
        )
    ]
)
