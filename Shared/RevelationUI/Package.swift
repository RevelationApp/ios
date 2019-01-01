// swift-tools-version:4.2
//
//  RevelationUI.swift
//  RevelationUI
//
//  Created by Rahul Katariya on 23/10/15.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "RevelationUI",
    products: [
        .library(
            name: "RevelationUI",
            targets: ["RevelationUI"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RevelationUI",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "RevelationUITests",
            dependencies: ["RevelationUI"],
            path: "Tests"
        )
    ]
)
