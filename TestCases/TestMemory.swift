#!/usr/bin/env xcrun swift

// http://stackoverflow.com/questions/32290485/audiotoolbox-c-function-pointers-and-swift


class MyClass {
  var v = 42
}

let o1 = MyClass()
let o2 = MyClass()

let data1 = unsafeAddressOf(o1)
let data2 = UnsafeMutablePointer<Void>(Unmanaged.passUnretained(o2).toOpaque())

let obj1 = unsafeBitCast(data1, MyClass.self)
let obj2 = Unmanaged<MyClass>.fromOpaque(COpaquePointer(data2)).takeUnretainedValue()

dump(obj1.v == obj2.v)
