import UIKit

// 프로퍼티 옵저버
var myAge = 0 {
    willSet {
        print("값이 설정 될 예정이다. myAge \(myAge)")
    }
    didSet {
        print("값이 설정 되었다. myAge \(myAge)")
    }
}

myAge = 10
myAge = 20
