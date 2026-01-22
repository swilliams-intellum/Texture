// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Texture",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v14)
    ],
    products: [
        .library(
            name: "AsyncDisplayKit",
            targets: ["AsyncDisplayKit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AsyncDisplayKit",
            url: "https://github.com/swilliams-intellum/Texture/releases/download/3.2.1/AsyncDisplayKit.xcframework.zip",
            checksum: "b80fd16b371558d746e04f59b5c5e87abc9189147c4d3fcf6b133953e6b7db94"
        )
    ]
)
