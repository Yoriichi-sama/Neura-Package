
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
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0")
    ],

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
