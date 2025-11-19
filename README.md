# XXHashKit

XXHashKit is a Swift wrapper around the official [xxHash](https://github.com/Cyan4973/xxHash) C library, providing **extremely fast hashing** with a clean, idiomatic Swift API.

`xxHash` is an extremely fast non-cryptographic hash algorithm, working at RAM speed limit. It is proposed in four flavors (XXH32, XXH64, XXH3_64bits and XXH3_128bits). The latest variant, XXH3, offers improved performance across the board, especially on small data.

This package fully adopts Apple’s `CryptoKit.HashFunction` protocol so that xxHash functions behave just like SHA256, MD5 (CommonCrypto), or other hashing APIs in Swift.

Supported algorithms:
- `XXH32` : 32-bit hash
- `XXH64` : 64-bit hash
- `XXH3` : 64-bit hash (XXH3-64)
- `XXH128` : 128-bit hash (XXH3-128)

All implementations provide:
- Streaming API (`update` / `finalize`)
- Copy-on-write state management
- `Sendable` conformance
- Strict compatibility with the xxHash C reference implementation

## Features

- CryptoKit-style API (`HashFunction`)
- Binary-compatible with xxHash C reference implementation
- Supports seeds and custom initialization
- Efficient streaming hashing
- Works on all Apple platforms (iOS, macOS, watchOS, tvOS, visionOS)
- Fully Little-Endian compatible (all modern Apple platforms)

## Requirements
<p>
  <img src="https://img.shields.io/badge/iOS-13+-333333.svg" alt="iOS 13+" />
  <img src="https://img.shields.io/badge/macOS-10.15+-333333.svg" alt="macOS 10.15+" />
  <img src="https://img.shields.io/badge/tvOS-13+-333333.svg" alt="tvOS 13+" />
  <img src="https://img.shields.io/badge/watchOS-6+-333333.svg" alt="watchOS 6+" />
  <img src="https://img.shields.io/badge/visionOS-1+-333333.svg" alt="visionOS 1+" />
</p>

## Installation

### Swift Package Manager

Add this to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/Jaesung-Jung/XXHashKit.git", from: "1.0.0")
]
```

Then add the product to your target:

```swift
.targets: [
  .target(
    name: "YourApp",
      dependencies: [
        .product(name: "XXHashKit", package: "XXHashKit")
      ]
  )
]
```

## Usage

```swift
import XXHashKit

let data = Data("The quick brown fox jumps over the lazy dog".utf8)

// XXH32
var hasher = XXH32(seed: 1234) // default seed is 0.
hasher.update(data: data)
let digest = Data(hasher.finalize())

// XXH64 with seed
var hasher = XXH64(seed: 1234) // default seed is 0.
hasher.update(data: data)
let digest = Data(hasher.finalize())

// XXH3 (XXH3-64bit)
var hasher = XXH3(seed: 1234) // default seed is 0.
hasher.update(data: data)
let digest = Data(hasher.finalize())

// XXH128 (XXH3-128bit)
var hasher = XXH128(seed: 1234) // default seed is 0.
hasher.update(data: data)
let digest = Data(hasher.finalize())
```

## LICENSE
MIT license. See [LICENSE](https://github.com/Jaesung-Jung/XXHashKit/blob/main/LICENSE) for details.
