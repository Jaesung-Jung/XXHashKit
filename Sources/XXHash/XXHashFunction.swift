//
//  XXHashFunction.swift
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

// MARK: - XXHashFunction

protocol XXHashFunction {
  associatedtype XXHashType: XXHash

  var state: XXHashState<XXHashType> { get set }
}

extension XXHashFunction {
  @inline(__always)
  private mutating func ensureUniqueState() {
    if !isKnownUniquelyReferenced(&state) {
      state = state.clone()
    }
  }

  public mutating func update(bufferPointer: UnsafeRawBufferPointer) {
    guard !bufferPointer.isEmpty, let base = bufferPointer.baseAddress else {
      return
    }
    ensureUniqueState()
    XXHashType.update(state.pointer, base, bufferPointer.count)
  }
}

// MARK: - XXHashState

final class XXHashState<XXHashType: XXHash>: @unchecked Sendable {
  let pointer: OpaquePointer

  init(seed: XXHashType.Seed) {
    self.pointer = XXHashType.createState()
    XXHashType.resetState(pointer, seed)
  }

  init(state: OpaquePointer) {
    self.pointer = state
  }

  deinit {
    XXHashType.freeState(pointer)
  }

  func clone() -> XXHashState<XXHashType> {
    let newState = XXHashState<XXHashType>(state: XXHashType.createState())
    XXHashType.copyState(pointer, newState.pointer)
    return newState
  }
}
