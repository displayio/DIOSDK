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
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.8.2/DIOSDK.zip",
            checksum: "a3527dd8812cbc9081837521e70d730bfc789be80beb1cf04ea20b29adf35b65"
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
