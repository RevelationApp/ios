// swift-tools-version:4.2
import PackageDescription
import Foundation

let package = Package(
    name: "AarKayRunner",
    products: [
        .executable(name: "aarkay-cli", targets: ["aarkay-cli"])],
    dependencies: [
        .package(url: "https://github.com/RahulKatariya/AarKay.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "aarkay-cli",
            dependencies: [
                "AarKayKit",
                "AarKayPlugin",
                "AarKay",
            ],
            path: "Sources/AarKayCLI"),],
    swiftLanguageVersions: [.v4, .v4_2]
)