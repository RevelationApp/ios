// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AarKayPersonal",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "AarKayPersonalCLI",
            targets: ["AarKayPersonalCLI"]
        ),
        .library(
            name: "aarkay-plugin-personal",
            targets: ["aarkay-plugin-personal"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/RahulKatariya/AarKay.git", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AarKayPersonalCLI",
            dependencies: ["aarkay-plugin-personal", "AarKay"]
        ),
        .target(
            name: "aarkay-plugin-personal",
            dependencies: ["AarKayPlugin"],
            path: "Sources/AarKayPersonal"
        ),
    ],
    swiftLanguageVersions: [4]
)
