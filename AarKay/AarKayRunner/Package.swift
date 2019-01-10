// swift-tools-version:4.2
import PackageDescription
import Foundation

let package = Package(
    name: "AarKayRunner",
    products: [
        .executable(name: "aarkay-cli", targets: ["aarkay-cli"])],
    dependencies: [
        .package(url: "https://github.com/RahulKatariya/AarKay.git", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/RahulKatariya/aarkay-plugin-coredata.git", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/RahulKatariya/aarkay-plugin-uberribs.git", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/Restofire/aarkay-plugin-restofire.git", .upToNextMinor(from: "0.2.0")),
        .package(url: "./../aarkay-plugin-personal", .branch("master")),
    ],
    targets: [
        .target(
            name: "aarkay-cli",
            dependencies: [
                "AarKayKit",
                "AarKayPlugin",
                "AarKay",
                "aarkay-plugin-coredata",
                "aarkay-plugin-uberribs",
                "aarkay-plugin-restofire",
                "aarkay-plugin-personal",
            ],
            path: "Sources/AarKayCLI"),],
    swiftLanguageVersions: [.v4, .v4_2]
)