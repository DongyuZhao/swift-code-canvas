// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeShell",
    // Raised minimum platform versions to enable native editor (AppKit on macOS 15+, UIKit on iPadOS 18+)
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "CodeShell",
            targets: ["CodeShell"]
        ),
        .executable(
            name: "CodeShellShowCase",
            targets: ["CodeShellShowCase"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-format.git", from: "510.1.0")
    ],
    targets: [
        .target(
            name: "CodeShell",
            dependencies: []
        ),
        .executableTarget(
            name: "CodeShellShowCase",
            dependencies: ["CodeShell"]
        ),
        .testTarget(
            name: "CodeShellTests",
            dependencies: ["CodeShell"]
        ),

    ],
    swiftLanguageModes: [.v6]
)
