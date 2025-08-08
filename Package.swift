// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeCanvas",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CodeCanvas",
            targets: ["CodeCanvas"]
        ),
        .executable(
            name: "CodeCanvasShowCase",
            targets: ["CodeCanvasShowCase"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-format.git", from: "510.1.0")
    ],
    targets: [
        .target(
            name: "CodeCanvas",
            dependencies: []
        ),
        .executableTarget(
            name: "CodeCanvasShowCase",
            dependencies: ["CodeCanvas"]
        ),
        .testTarget(
            name: "CodeCanvasTests",
            dependencies: ["CodeCanvas"]
        ),

    ],
    swiftLanguageModes: [.v6]
)
