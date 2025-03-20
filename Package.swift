// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Routard",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Routard",
            targets: ["Routard"]
        )
    ],
    targets: [
        .target(
            name: "Routard"
        ),
        .testTarget(
            name: "RoutardTests",
            dependencies: ["Routard"]
        )
    ]
)
