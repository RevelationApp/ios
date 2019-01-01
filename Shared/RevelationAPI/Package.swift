// swift-tools-version:4.2
//
//  RevelationAPI.swift
//  RevelationAPI
//
//  Created by Rahul Katariya on 23/10/15.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "RevelationAPI",
    products: [
        .library(
            name: "RevelationAPI",
            targets: ["RevelationAPI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Restofire/Restofire.git", from: "5.0.0-alpha.1")
    ],
    targets: [
        .target(
            name: "RevelationAPI",
            dependencies: ["Restofire"],
            path: "Sources"
        ),
        .testTarget(
            name: "RevelationAPITests",
            dependencies: ["RevelationAPI"],
            path: "Tests"
        )
    ]
)
