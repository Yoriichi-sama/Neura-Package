
import PackageDescription

let package = Package(
    name: "Neura",
    platforms: [
        .ios(.v13)
    ],
    products: [
        .library(
            name: "Neura",
            targets: ["Neura"]
        ),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Neura",
            dependencies: []
        ),
        .testTarget(
            name: "NeuraTests",
            dependencies: ["Neura"]
        ),
    ]
)
