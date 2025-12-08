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
        ),
        .library(
            name: "DIOSDKCore",
            targets: ["DIOSDKCoreWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DIOSDK",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/sdk/4.4.6/DIOSDK.zip",
            checksum: "a42f08d718ab49cedffdc113f2620d913da054891ef064626ed8fb60e104bbf8"
        ),
        .binaryTarget(
            name: "FBAudienceNetwork",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/FBAudienceSDK/FBAudienceNetwork-6.20.1.zip",
            checksum: "6d4827501812b47af0c3ccf74c14eb39a651fe30fb414a54a6114dda5bc793ff"
        ),
        .binaryTarget(
            name: "DIOFacebookAdapter",
            url: "https://mp-cocoapods-hosting.s3.us-west-2.amazonaws.com/fbadapter/4.4.6/DIOFacebookAdapter.zip",
            checksum: "ab05e00650425a365a4cff17c793d389060b6c39f2d8829faf411beec3e00a9e"
        ),
        .target(
            name: "DIOSDKWrapper",
            dependencies: [
                "DIOSDK",
                "FBAudienceNetwork",
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
