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
            url: "https://github.com/swilliams-intellum/Texture/releases/download/3.2.2/AsyncDisplayKit.xcframework.zip",
            checksum: "e379a6ea39763f63bd8e8c93f28c04dd1aa3a52a9c676cc0e2ea6dcf336d32b2"
        )
    ]
)
