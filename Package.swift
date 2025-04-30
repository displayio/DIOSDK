// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DIOSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "DIOSDK",
            targets: ["DIOSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.3.7/DIOSDK.zip",
            checksum: "deb53109684aa043484934bd4b26a6368a5b244734f6b1a3d2b8c292117d68de"
        )
    ]
)
