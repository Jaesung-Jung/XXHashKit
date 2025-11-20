// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftXXHash",
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
      name: "XXHash",
      targets: ["XXHash"]
    ),
  ],
  targets: [
    .target(
      name: "XXHash",
      dependencies: ["libxxhash"]
    ),
    .target(
      name: "libxxhash",
      sources: ["xxhash.c"],
      publicHeadersPath: ".",
      cSettings: [
        .define("XXH_CPU_LITTLE_ENDIAN")
      ]
    ),
    .testTarget(
      name: "SwiftXXHashTests",
      dependencies: ["XXHash"]
    ),
  ]
)
