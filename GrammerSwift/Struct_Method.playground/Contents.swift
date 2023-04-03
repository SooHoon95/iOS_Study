import UIKit

// struct 에서도 메소드를 가질수 있습니다.
// struct 는 생성자를 만들지 않아도 알아서 init해준다.(멤버와이즈 initialize)
struct Friend {
    
    var age : Int
    
    var name : String
    
    func sayHello() -> String {
        print("sayHello()")
        return "저는 \(age)살, \(name) 입니다."
    }
}

var myFriend = Friend(age: 10, name: "쩡대리")

myFriend.sayHello()
 
