// swift-tools-version:5.3
// DIOSDK - Complete SDK (includes FBAudienceNetwork via SPM)
// DIOSDKCore - add FBAudienceNetwork dependency separately
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
            name: "DIOSDKCore",
            targets: ["DIOSDKCoreWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/facebook/FBAudienceNetwork", from: "6.21.0")
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.5.0/DIOSDK.zip",
            checksum: "18ed0915ed9950fd6b2f26e64d334b42ddf29e21eafd43797861e76ff8e34d49"
        ),
        .binaryTarget(
            name: "DIOFacebookAdapter",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/fbadapter/4.5.0/DIOFacebookAdapter.zip",
            checksum: "3cfe3966267aadcf9e3b534bb57340938418ab7f9b592c011c2cb07ea8e405ba"
        ),
        .target(
            name: "DIOSDKWrapper",
            dependencies: [
                "DIOSDK",
                .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork"),
                "DIOFacebookAdapter"
            ]
        ),
        .target(
            name: "DIOSDKCoreWrapper",
            dependencies: [
                "DIOSDK",
                "DIOFacebookAdapter"
            ]
        )
    ]
)
