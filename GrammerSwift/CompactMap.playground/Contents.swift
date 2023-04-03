import UIKit

var myArray = ["one", "1", "two", "2"]

//let intArray = myArray.map { item in
//    return Int(item)
//}
//
//print(intArray)

let onlyIntArray = myArray.compactMap { item in
    return Int(item)
}

print(onlyIntArray)
