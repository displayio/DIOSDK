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
            targets: ["DIOSDKWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.4.4/DIOSDK.zip",
            checksum: "f8151fb6a60ccd560794d35067afe878cbfcc6cdc9d57f479e21881badffaf14"
        ),
        .binaryTarget(
            name: "FBAudienceNetwork",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/FBAudienceSDK/FBAudienceNetwork-6.20.1.zip",
            checksum: "6d4827501812b47af0c3ccf74c14eb39a651fe30fb414a54a6114dda5bc793ff"
        ),
        .binaryTarget(
            name: "DIOFacebookAdapter",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/fbadapter/4.4.3/DIOFacebookAdapter.zip",
            checksum: "854490f83dd0b94679bf26509899f4a675b15cca12d2f6ff589260cac2a78ce7"
        ),
        .target(
            name: "DIOSDKWrapper",
            dependencies: [
                "DIOSDK",
                "FBAudienceNetwork",
                "DIOFacebookAdapter"
            ]
        )
    ]
)
