import UIKit

let numbers = [1,1,1,5,5,9,7]

let uniqueNumbers = Set(numbers)

uniqueNumbers   // 고유한 애들만 넣는다.

var uniqureNumbersArraged = Array(uniqueNumbers)

uniqureNumbersArraged.sort()
