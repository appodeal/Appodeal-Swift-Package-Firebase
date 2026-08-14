// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealFirebaseAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealFirebaseAdapter",
            targets: ["AppodealFirebaseAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.15.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.15.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.15.0"),
    ],
    targets: [
        .target(
            name: "AppodealFirebaseAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
                .target(name: "AppodealFirebaseAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealFirebaseAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealFirebaseAdapter/12.15.0.0/AppodealFirebaseAdapter.xcframework.zip",
            checksum: "f6d34039e74f77c6105a5711d81196b1d498cf7675404898ecfb9ff77bd831dd"
        ),

    ]
)
