// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "XXHashKit",
  platforms: [
    .iOS(.v13),
    .macCatalyst(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
    .visionOS(.v1)
  ],
  products: [
    .library(
      name: "XXHashKit",
      targets: ["XXHashKit"]
    ),
  ],
  targets: [
    .target(
      name: "XXHashKit",
      dependencies: ["XXHash"]
    ),
    .target(
      name: "XXHash",
      sources: ["xxhash.c"],
      publicHeadersPath: ".",
      cSettings: [
        .define("XXH_CPU_LITTLE_ENDIAN")
      ]
    ),
    .testTarget(
      name: "XXHashKitTests",
      dependencies: ["XXHashKit"]
    ),
  ]
)
