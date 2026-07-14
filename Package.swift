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
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.7.5/DIOSDK.zip",
            checksum: "809ec283ae1479866b33b847670795dff23c453ae707aa44b074ea3d750f52be"
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
