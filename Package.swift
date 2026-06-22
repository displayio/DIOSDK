// swift-tools-version:5.3
// DIOSDK — two products:
//   - "DIOSDK": includes FBAudienceNetwork transitively via SPM (default)
//   - "DIOSDK-WithoutFBAudienceNetwork": does not pull FBAudienceNetwork;
//     consumer is responsible for providing it themselves (any version, any way)
import PackageDescription

let package = Package(
    name: "DIOSDK",
    platforms: [
        .iOS(.v13)
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
        .package(url: "https://github.com/facebook/FBAudienceNetwork", from: "6.21.0")
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.7.4/DIOSDK.zip",
            checksum: "a985056e0b7d20c4d907ca2f04e22c1f1f8e342af84f6c1e340783eec5a069f2"
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
