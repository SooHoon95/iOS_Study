import UIKit

// Flat -> 납작하게
// 2차원 배열 -> 1차원 배열

let myFriends = [
    ["철수"],
    ["영희"],
    ["제임스", "본드"],
    ["스티브", "잡스"],
    ["개발하는","정대리"],
]

let flatMap = myFriends.flatMap { (item : [String]) in
    return item
}

print(flatMap)

