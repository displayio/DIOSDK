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
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.4.2/DIOSDK.zip",
            checksum: "7db041c53281cf12a422042ac78a052623877c427ab241a19b62634968a5c622"
        )
    ]
)
