import UIKit
//
//class Friend {
//
//    var name: String
//    var age: Int
//
//    var detailInfo : String = ""
//
//    var info : String {
//        get{
//            return "내 친구: \(name) / 나이: \(age)"
//        }
//        set {
//            detailInfo = "info 에서 설정됨 :" + newValue
//        }
//    }
//
//    init(_ name: String, _ age: Int){
//        self.name = name
//        self.age = age
//    }
//
//}
//
//let myFriend = Friend("쩡대리", 20)
//
//myFriend.info = "호롤롤로"
//myFriend.detailInfo
//

// getter : 가져올때, setter: 설정할 때
class Friend {
    
    var name: String
    var age: Int
    
    // setter
    var detailInfo: String = ""
    
    // getter
    var info: String {
        get {
            return "내 친구 : \(name) 나이 : \(age) "
        }
        set {
            // 값이 들어왔을 때 값을 새로 세팅할 수 있다.
            // newValue = 들어오는 값
            detailInfo = "info 에서 설정됨 : \(newValue)"
        }
    }
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
}


let myFriend = Friend("쩡대리", 20)

myFriend.info

myFriend.info = "호롤롤롤"
myFriend.detailInfo
