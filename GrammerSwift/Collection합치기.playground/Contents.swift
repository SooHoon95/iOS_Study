import UIKit

// 콜렉션 - list [].  set<> , dictionary [:]

let myFriends = ["철수", "영희", "수잔"]
//let otherFriends = ["제임스", "존슨", "존시나"]
let otherFriends : Set<String> = ["제임스", "존슨", "존시나"]

// let 이라서 안됨 그치만 합치는거는 걍 합쳐짐
//myFriends.append(contentsOf: otherFriends)


let totlaFriends = myFriends + otherFriends

totlaFriends
