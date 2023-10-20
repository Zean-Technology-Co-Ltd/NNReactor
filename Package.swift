// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NNReactor",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "NNReactor", targets: ["NNReactor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0")),
        .package(url: "https://github.com/Zean-Technology-Co-Ltd/FoundationEx.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/Zean-Technology-Co-Ltd/NNToast.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", .upToNextMajor(from: "3.0.0")),
    ],
    targets: [
        .target(
            name: "NNReactor",
            dependencies: [
              "RxSwift",
              "NNToast",
              "ReactorKit",
              .product(name: "RxCocoa", package: "RxSwift"),
              .product(name: "Toast", package: "NNToast"),
              .product(name: "HUD", package: "NNToast"),
              "FoundationEx"
            ]),
        .testTarget(
            name: "NNReactorTests",
            dependencies: ["NNReactor"]),
    ]
)
