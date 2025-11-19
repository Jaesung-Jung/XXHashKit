//
//  XXHash.swift
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

import XXHash

// MARK: - XXHash

protocol XXHash {
  associatedtype Seed: FixedWidthInteger & UnsignedInteger
  associatedtype XXHDigest

  static func createState() -> OpaquePointer
  static func resetState(_ state: OpaquePointer, _ seed: Seed)
  static func copyState(_ src: OpaquePointer, _ dst: OpaquePointer)
  static func freeState(_ state: OpaquePointer)

  static func update(_ state: OpaquePointer, _ input: UnsafeRawPointer, _ length: Int)
  static func digest(_ state: OpaquePointer) -> XXHDigest
}

// MARK: - XXHash32

enum XXHash32: XXHash {
  static func createState() -> OpaquePointer {
    XXH32_createState()
  }

  static func resetState(_ state: OpaquePointer, _ seed: UInt32) {
    XXH32_reset(state, seed)
  }

  static func copyState(_ src: OpaquePointer, _ dst: OpaquePointer) {
    XXH32_copyState(dst, src)
  }

  static func freeState(_ state: OpaquePointer) {
    XXH32_freeState(state)
  }

  static func update(_ state: OpaquePointer, _ input: UnsafeRawPointer, _ length: Int) {
    XXH32_update(state, input, length)
  }

  static func digest(_ state: OpaquePointer) -> XXH32_hash_t {
    XXH32_digest(state)
  }
}

// MARK: - XXHash64

enum XXHash64: XXHash {
  static func createState() -> OpaquePointer {
    XXH64_createState()
  }

  static func resetState(_ state: OpaquePointer, _ seed: UInt64) {
    XXH64_reset(state, seed)
  }

  static func copyState(_ src: OpaquePointer, _ dst: OpaquePointer) {
    XXH64_copyState(dst, src)
  }

  static func freeState(_ state: OpaquePointer) {
    XXH64_freeState(state)
  }

  static func update(_ state: OpaquePointer, _ input: UnsafeRawPointer, _ length: Int) {
    XXH64_update(state, input, length)
  }

  static func digest(_ state: OpaquePointer) -> XXH64_hash_t {
    XXH64_digest(state)
  }
}

// MARK: - XXHash3_64

enum XXHash3_64: XXHash {
  static func createState() -> OpaquePointer {
    XXH3_createState()
  }

  static func resetState(_ state: OpaquePointer, _ seed: UInt64) {
    XXH3_64bits_reset_withSeed(state, seed)
  }

  static func copyState(_ src: OpaquePointer, _ dst: OpaquePointer) {
    XXH3_copyState(dst, src)
  }

  static func freeState(_ state: OpaquePointer) {
    XXH3_freeState(state)
  }

  static func update(_ state: OpaquePointer, _ input: UnsafeRawPointer, _ length: Int) {
    XXH3_64bits_update(state, input, length)
  }

  static func digest(_ state: OpaquePointer) -> XXH64_hash_t {
    XXH3_64bits_digest(state)
  }
}

// MARK: - XXHash3_128

enum XXHash3_128: XXHash {
  static func createState() -> OpaquePointer {
    XXH3_createState()
  }

  static func resetState(_ state: OpaquePointer, _ seed: UInt64) {
    XXH3_128bits_reset_withSeed(state, seed)
  }

  static func copyState(_ src: OpaquePointer, _ dst: OpaquePointer) {
    XXH3_copyState(dst, src)
  }

  static func freeState(_ state: OpaquePointer) {
    XXH3_freeState(state)
  }

  static func update(_ state: OpaquePointer, _ input: UnsafeRawPointer, _ length: Int) {
    XXH3_128bits_update(state, input, length)
  }

  static func digest(_ state: OpaquePointer) -> XXH128_hash_t {
    XXH3_128bits_digest(state)
  }
}
