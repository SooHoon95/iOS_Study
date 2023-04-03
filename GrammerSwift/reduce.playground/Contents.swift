import UIKit

struct Friend : Hashable {
    var name: String
    var age: Int
}

let myFriends = [
Friend(name: "철수", age: 10),
Friend(name: "영희", age: 20),
Friend(name: "찰리", age: 20),
Friend(name: "레이첼", age: 30),
Friend(name: "수잔", age: 30),
]

// 요소들을 다 합친다. () 안은 초기값. 배열순서가아님.
let totlaAge = myFriends.reduce(100) { partialResult, aFriend in
    return partialResult + aFriend.age
}

totlaAge

// 나이 별로 묶고싶다!
// [:]
let groupedFriends = myFriends.reduce(into: [:]) { partialResult, aFriend in
    partialResult[aFriend.age] = myFriends.filter{ $0.age == aFriend.age } // return 생략된거
}

groupedFriends
