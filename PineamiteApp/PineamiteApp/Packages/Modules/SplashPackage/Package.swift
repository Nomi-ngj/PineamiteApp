// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Splash",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Splash",
            targets: ["Splash"]
        ),
    ],
    targets: [
        .target(
            name: "Splash"
        )
    ]
)
