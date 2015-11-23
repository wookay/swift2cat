#!/usr/bin/env xcrun swift

public struct 공공시설 {
  var 시설명: String
}

public struct 문화강좌 {
  var 강좌명: String
}

public class 문화센터강좌 {
  var 시설: 공공시설
  var 프로그램: [문화강좌] = []

  init(시설: 공공시설) {
    self.시설 = 시설
  }

  func 프로그램추가(강좌: 문화강좌) {
    self.프로그램.append(강좌)
  }
}

let 강북 = 공공시설(시설명: "강북")
let 센터 = 문화센터강좌(시설: 강북)
센터.프로그램추가(문화강좌(강좌명: "요리교실"))

dump(센터)

let mem = String(unsafeAddressOf(센터))
print("mem \(mem)")

import Foundation
var u: UInt64 = 0
NSScanner(string: mem).scanHexLongLong(&u)
// String(u, radix: 16)
print(String(format: "u   0x%0*llx", sizeof(u.dynamicType)*2, u))

let ptr = UnsafeMutablePointer<UInt>(bitPattern: UInt(u))

let 쎈터 = unsafeBitCast(ptr, 문화센터강좌.self)
dump(쎈터)
