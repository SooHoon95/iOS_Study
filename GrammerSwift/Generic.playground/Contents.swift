import UIKit


// Generic -> 어떠한 자료형이든지 받겠다.
struct MyArray<SomeElement> {
    // 제네릭을 담은 빈 배열
    var elements: [SomeElement] = [SomeElement]()
    
    // 생성자
    init(_ elements: [SomeElement]) {
        // struct는 안만들어도 됨
        self.elements = elements
    }
}

struct Friend {
    var name: String
}

struct PpackCorder{
    var name: String
}

var mySomeArray = MyArray([1,2,3])
print("mySomeArray : \(mySomeArray)")


var myStringArray = MyArray(["ga","na", "da"])
print("myStringArray : \(myStringArray)")

let friend1 = Friend(name: "철")
let friend2 = Friend(name: "영")
let friend3 = Friend(name: "수")

var myFriendArray = MyArray([friend1,friend2,friend3])

print("myFriendArray : \(myFriendArray)")
