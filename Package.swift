// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "XXHashKit",
  products: [
    .library(
      name: "XXHashKit",
      targets: ["XXHashKit"]
    ),
  ],
  targets: [
    .target(
      name: "XXHashKit"
    ),
    .testTarget(
      name: "XXHashKitTests",
      dependencies: ["XXHashKit"]
    ),
  ]
)
