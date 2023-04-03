import UIKit

let myFriendsArray : [String] = ["철수", "영희", "수진", "제임스", "마크"]

var friendsWithIndex : [String] = []

// enumerated() -> (index, elements)
for (index, aFriend) in myFriendsArray.enumerated() {
    print("index: \(index), item: \(aFriend)")
    friendsWithIndex.append("\(index).번 \(aFriend)")
}

