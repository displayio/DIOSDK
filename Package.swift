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
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.3.6/DIOSDK.zip",
            checksum: "112bdfe0fbc87b55c3929e3bb4783d5d3b71bf8b06260c11a9cacacf19158d58"
        )
    ]
)
