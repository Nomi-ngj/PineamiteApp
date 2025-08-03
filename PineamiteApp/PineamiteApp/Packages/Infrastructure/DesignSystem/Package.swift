// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Theme")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies:
                ["Domain", "Theme"]
//                [
//                .product(name: "Domain", package: "Domain")
//                .product(name: "Domain", package: "Domain")
//            ]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]
        ),
    ]
)
