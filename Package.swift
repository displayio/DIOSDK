// swift-tools-version:5.5
// DIOSDK — two products:
//   - "DIOSDK": includes FBAudienceNetwork transitively via SPM (default)
//   - "DIOSDK-WithoutFBAudienceNetwork": does not pull FBAudienceNetwork;
//     consumer is responsible for providing it themselves (any version, any way)
import PackageDescription

let package = Package(
    name: "DIOSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DIOSDK",
            targets: ["DIOSDKWrapper"]
        ),
        .library(
            name: "DIOSDK-WithoutFBAudienceNetwork",
            targets: ["DIOSDKWrapperNoFAN"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/facebook/FBAudienceNetwork", from: "6.22.0")
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.8.0/DIOSDK.zip",
            checksum: "27d6a4def9a20cf668d616a20bf5f15de1a35091ba9a85935c379ebc02294ca8"
        ),
        .target(
            name: "DIOSDKWrapper",
            dependencies: [
                "DIOSDK",
                .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork")
            ]
        ),
        .target(
            name: "DIOSDKWrapperNoFAN",
            dependencies: ["DIOSDK"]
        )
    ]
)
