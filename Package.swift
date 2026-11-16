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
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.19.3"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealFirebaseAdapter/12.19.3.0/0df3a61a054f/AppodealFirebaseAdapter.xcframework.zip",
            checksum: "0df3a61a054fcbada86eaa136385e267fe03d1d3128bbc4e3670049d8d15e903"
        ),

    ]
)
