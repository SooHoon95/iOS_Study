import UIKit

var myArray = [3, 4, 88, 99, 5, 6, 7 , 8, 10, 20, 100]

// 오름차순 정렬 : 낮은번호 -> 높은 번호
var ascendingArray = myArray.sorted()

// sorted = 반환하는거
// sort는 자기 자신이 정렬 되는 것

myArray.sort()

// 내림차순 정렬 : 큰순서 -> 낮은 순서
var descendingArray = myArray.sorted(by: >)

myArray.sort(by: >)
