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
            checksum: "301bea7bde9074e2044eeb381750c8f747331d6f560b7c248e751a223a92b0bf"
        )
    ]
)
