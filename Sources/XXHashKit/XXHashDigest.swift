//
//  XXHashDigest.swift
//
//  Copyright © 2025 Jaesung Jung. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import CryptoKit

// MARK: - XXHashDigest

public protocol XXHashDigest: Digest {
  var bytes: [UInt8] { get }
}

extension XXHashDigest {
  public var description: String {
    var result = ""
    result.reserveCapacity(bytes.count * 2)
    for byte in bytes {
      let hexString = String(byte, radix: 16)
      result.append(hexString.count == 1 ? "0\(hexString)" : hexString)
    }
    return result
  }

  public func makeIterator() -> IndexingIterator<Array<UInt8>> {
    bytes.makeIterator()
  }

  public func withUnsafeBytes<R>(_ body: (UnsafeRawBufferPointer) throws -> R) rethrows -> R {
    try bytes.withUnsafeBytes(body)
  }
}

// MARK: - XXH32Digest

public struct XXH32Digest: XXHashDigest {
  public static let byteCount = 4

  public let bytes: [UInt8]

  init(digest: UInt32) {
    self.bytes = Swift.withUnsafeBytes(of: digest.bigEndian) { Array($0) }
  }
}

// MARK: - XXH64Digest

public struct XXH64Digest: XXHashDigest {
  public static let byteCount = 8

  public let bytes: [UInt8]

  init(digest: UInt64) {
    self.bytes = Swift.withUnsafeBytes(of: digest.bigEndian) { Array($0) }
  }
}

// MARK: - XXH128Digest

public struct XXH128Digest: XXHashDigest {
  public static let byteCount = 16

  public let bytes: [UInt8]

  init(low: UInt64, high: UInt64) {
    let lowBytes = Swift.withUnsafeBytes(of: low.bigEndian) { Array($0) }
    let highBytes = Swift.withUnsafeBytes(of: high.bigEndian) { Array($0) }
    self.bytes = highBytes + lowBytes
  }
}
