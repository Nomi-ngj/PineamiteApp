// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EntryList",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "EntryList",
            targets: ["EntryList"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
//        .package(path: "../DesignSystem"),
        .package(path: "../RallyMap"),
    ],
    targets: [
        .target(
            name: "EntryList",
            dependencies: ["Domain", "RallyMap"]
        ),
        .testTarget(
            name: "EntryListTests",
            dependencies: ["EntryList"]
        ),
    ]
)

