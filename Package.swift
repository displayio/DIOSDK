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
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.3.5/DIOSDK.zip",
            checksum: "bebee31d7675e9558db97b936b8a91d31ebb79fab22babba40807f6fe9ec405d"
        )
    ]
)
