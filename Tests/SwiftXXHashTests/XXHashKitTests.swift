//
//  SwiftXXHashTests.swift
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

import Foundation
import Testing
@testable import XXHash

extension Tag {
  @Tag static var xxh32: Self
  @Tag static var xxh64: Self
  @Tag static var xxh3: Self
  @Tag static var xxh128: Self
}

// MARK: - XXH32

@Test(.tags(.xxh32))
func testXXH32() throws {
  XXH32.hash(data: <#T##DataProtocol#>)
  let data = try #require("XXHash".data(using: .utf8))

  var xxh32 = XXH32()
  xxh32.update(data: data)

  let digest = xxh32.finalize()
  #expect(Data(digest).count == XXH32.Digest.byteCount)
  #expect(digest.description == "f03413fa")
}

@Test(.tags(.xxh32))
func testXXH32WithSeed() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh32 = XXH32(seed: 1234)
  xxh32.update(data: data)

  let digest = xxh32.finalize()
  #expect(Data(digest).count == XXH32.Digest.byteCount)
  #expect(digest.description == "a6098466")
}

// MARK: - XXH64

@Test(.tags(.xxh64))
func testXXH64() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh64 = XXH64()
  xxh64.update(data: data)

  let digest = xxh64.finalize()
  #expect(Data(digest).count == XXH64.Digest.byteCount)
  #expect(digest.description == "e766a14ab106f486")
}

@Test(.tags(.xxh64))
func testXXH64WithSeed() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh64 = XXH64(seed: 1234)
  xxh64.update(data: data)

  let digest = xxh64.finalize()
  #expect(Data(digest).count == XXH64.Digest.byteCount)
  #expect(digest.description == "b3caa93f6fb70a2c")
}

// MARK: - XXH3

@Test(.tags(.xxh3))
func testXXH3_64() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh3 = XXH3()
  xxh3.update(data: data)

  let digest = xxh3.finalize()
  #expect(Data(digest).count == XXH64.Digest.byteCount)
  #expect(digest.description == "2c5d72e7c6b5de25")
}

@Test(.tags(.xxh3))
func testXXH3WithSeed() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh3 = XXH3(seed: 1234)
  xxh3.update(data: data)

  let digest = xxh3.finalize()
  #expect(Data(digest).count == XXH64.Digest.byteCount)
  #expect(digest.description == "d8a1f61acfff8736")
}

// MARK: - XXH128

@Test(.tags(.xxh128))
func testXXH128() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh128 = XXH128()
  xxh128.update(data: data)

  let digest = xxh128.finalize()
  #expect(Data(digest).count == XXH128.Digest.byteCount)
  #expect(digest.description == "e13152f3c2792251c32761afdc0e379b")
}

@Test(.tags(.xxh128))
func testXXH128WithSeed() throws {
  let data = try #require("XXHash".data(using: .utf8))

  var xxh128 = XXH128(seed: 1234)
  xxh128.update(data: data)

  let digest = xxh128.finalize()
  #expect(Data(digest).count == XXH128.Digest.byteCount)
  #expect(digest.description == "04deea421cd53d55b7038489d0526945")
}
