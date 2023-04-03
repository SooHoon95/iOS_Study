import UIKit


class Friend {
    func sayHi() {
        print("HI?!")
    }
    
    class func sayBye() {
        print("byebye!!")
    }
    
    static func sayhoho() {
        print("HOHO!")
    }
}

class BestFriend: Friend {
    class override func sayBye() {
        
        print("override sayBye~!")
    }
    
    func sayhoho() {
        print("override say HOHO~!")
    }
    
}


// 원래는 이렇게 객채를 변수에 담아서 호출해야한다.
let myFriend = Friend()
myFriend.sayHi()

// class func 는 객체를 메모리에 올리지않고, 즉, 객체에 올리지 않고 바로 쓸 수 있다.
// class func 는 상속이 가능하지만 static 은 override 가 불가능 하다.
// 즉, static = final 과 비슷한 의미

Friend.sayBye()
Friend.sayhoho()

BestFriend.sayBye()

BestFriend.sayhoho()

