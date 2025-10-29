// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PineamiteNetworking",
    platforms: [
        .iOS(.v15), .macOS(.v12), .watchOS(.v8), .tvOS(.v15)
    ],
    products: [
        .library(name: "PineamiteNetworking", targets: ["PineamiteNetworking"]),
        .library(name: "PineamiteNetworkingMocks", targets: ["PineamiteNetworkingMocks"])
    ],
    targets: [
        .target(
            name: "PineamiteNetworking",
            path: "Sources/PineamiteNetworking"
        ),
        .target(
            name: "PineamiteNetworkingMocks",
            dependencies: ["PineamiteNetworking"],
            path: "Sources/PineamiteNetworkingMocks",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "PineamiteNetworkingTests",
            dependencies: ["PineamiteNetworking", "PineamiteNetworkingMocks"],
            path: "Tests/PineamiteNetworkingTests"
        )
    ]
)
