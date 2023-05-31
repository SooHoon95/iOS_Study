//
//  main.swift
//  CodingTest
//
//  Created by 최수훈 on 2023/04/28.
//

import Foundation

//func solution(_ cards:[Int], _ shuffles:[String]) -> [Int] {
//
//    var deg1: [Int] = []
//    var deg2: [Int] = []
//    var result = cards
//
//    for shuffle in shuffles {
//
//        deg1.removeAll()
//        deg2.removeAll()
//
//        for i in 0...result.count - 1 {
//
//            if i < (result.count / 2) {
//                // n/2 까지 덱1에 추가
//
//                deg1.append(result[i])
//            } else {
//                deg2.append(result[i])
//            }
//        }
//
//        if shuffle == "Cut" {
//            result.removeAll()
//            result = deg2 + deg1
////            deg2.map { result.append($0)}
////            deg1.map { result.append($0)}
//        } else {
//            // Riffle 함수
//            result.removeAll()
//            for j in 0...(cards.count / 2) - 1 {
//
//                // 0 1 2 3
//                result.append(deg2[j])
//                result.append(deg1[j])
//            }
//        }
//    }
//    print(result)
//    return result
//}
//
//
//
//solution([5,2,4,6,1,3], ["Riffle","Riffle","Riffle"])


// MARK: - wemade 2번

import Foundation

func isValid(_ s: String) -> Bool {

    if s == "a" {
        return true
    }

    var original = s.map { String($0) }

    for i in 0...original.count - 1 {
        if original[i] == "a" {
            original[i] = " "
        }
        if original[i] == "b" { break }
    }

    for i in 0...original.count - 1 {
        if original[original.count - i - 1] == "a" {
            original[original.count - i - 1] = " "
        }
        if original[original.count - i - 1] == "b" { break }
    }

    var withoutEdgeA = original.filter { $0 != " " }

    var startBCount = 0,
        endBCount = 0

    for i in 0...withoutEdgeA.count - 1 {
        if withoutEdgeA[i] == "b" {
            startBCount += 1
            withoutEdgeA[i] = " "
        }

        if withoutEdgeA[i] == "a" { break }
    }

    for i in 0...withoutEdgeA.count - 1 {
        if withoutEdgeA[withoutEdgeA.count - i - 1] == "b" {
            endBCount += 1
            withoutEdgeA[withoutEdgeA.count - i - 1] = " "
        }

        if withoutEdgeA[withoutEdgeA.count - i - 1] == "a" { break }
    }

    if startBCount != endBCount { return false }

    var withoutEdgeAB = withoutEdgeA.filter { $0 != " " }

    return isValid(withoutEdgeAB.joined(separator: ""))

  }





func solution(_ a:[String]) -> [Bool] {

    return a.map { isValid($0) }
}
//a.map {isValid($0)}

solution(["abab","bbaa","bababa","bbbabababbbaa"])













//
//func solution(_ players:[String], _ callings:[String]) -> [String] {
//
//    //실시간 랭킹 배열
//       var realTimeRanking:[String] = players
//
//       //실시간 딕셔너리 순위
//       var dic:[String:Int] = [:]
//
//       for i in 0..<players.count{
//           dic[players[i]] = i
//       }
//
//
//       //callings 만큼 반복
//       for name in callings{
//           if let index = dic[name]{
//               //딕셔너리 순위변경
//               dic[realTimeRanking[index-1]] = (dic[realTimeRanking[index-1]] ?? 0) + 1 // <- 따잇당한놈
//               dic[realTimeRanking[index]] = (dic[realTimeRanking[index]] ?? 0) - 1 // <- 따잇한놈
//
//
//               realTimeRanking.insert(realTimeRanking[index], at: index - 1)
//               realTimeRanking.remove(at: index + 1)
//           }
//       }
//
//       return realTimeRanking
//}


//print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
//
//
//var players = players
//
//   callings.forEach { name in
//       if let index = players.firstIndex(of: name) {
//           players.remove(at: index)
//           players.insert(name, at: index - 1)
//       }
//   }
//
//   return players


//
//
//func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
//
//    var result: [Int] = []
//
//    var dic: [String : Int] = [:]
//    for i in 0...name.count - 1 {
//        dic[name[i]] = yearning[i]
//    }
//
//    photo.forEach { picture in
//        var score = 0
//        picture.map { name in
//            score += dic[name] ?? 0
//        }
//        result.append(score)
//    }
//
//    print(result)
//    return result
//}

//print(
//    solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]])
//)


//func solution(_ park:[String], _ routes:[String]) -> [Int] {
//    let park = park
//    var routes = routes
//
//    park.map { chr in
//        chr.map { chr in
//            print(chr)
//        }
//    }
//
//    var startPoint = [0,0]
//    startPoint = getStartPoint(park, routes)
//
//        for route in routes {
//
//            var order = route.split(separator: " ")
//
//            let direction = order[0]
//            let distance = Int(order[1])!
//
//
//            for _ in 0...distance - 1 {
//                switch direction {
//                case "W":
//                    if 0 <= (startPoint[1] - 1){
//                        startPoint[1] -= 1
//
//                    }
//                case "E":
//                    if  park[0].count >= startPoint[1] + 1 {
//                        startPoint[1] += 1
//                    }
//                case "S":
//                    if park.count >= startPoint[0] + 1 {
//                        startPoint[0] += 1
//                    }
//                case "N":
//                    if 0 <= startPoint[0] - 1 {
//                        startPoint[0] -= 1
//                    }
//                default:
//                    break
//                }
////                print(startPoint)
//            }
//
//
//        }
//    return startPoint
//}
//
//func getStartPoint(_ park: [String], _ routes: [String]) -> [Int] {
//
//    var startPoint = [0,0]
//     for parkLine in park {
//         if parkLine.contains("S") {
//             for s in parkLine {
//                 if s == "S" {
//                     break
//                 } else {
//                     startPoint[1] += 1
//                 }
//
//             }
//             break
//         } else { startPoint[0] += 1 }
//
//     }
//    return startPoint
//}


//func solution(_ wallpaper:[String]) -> [Int] {
//    var wallpaper = wallpaper
//
//    var result: [Int] = [0,0,0,0]
//
//    var row: [Int] = []
//    var col: [Int] = []
//
//    for i in 0...wallpaper.count - 1 {
//        if wallpaper[i].contains("#"){
//
//            row.append(i)
//
//
//            // column 구하기
//            let row = wallpaper[i].map { $0 }
//
//            for j in 0...row.count - 1 {
//
//                if row[j] == "#" {
//                    col.append(j)
//                }
//            }
//        }
//
//
//    }
//
//  // MARK: - 내장함수 써서 구하는 방법
//    result[0] = row.min() ?? 0
//    result[1] = col.min() ?? 0
//    result[2] =  (row.max() ?? 0) + 1
//    result[3] =  (col.max() ?? 0) + 1
//
//
//
//
// //MARK: - for문으로 최대 최소 구하는 방법
//    var rowMax = row[0]
//    var rowMin = row[0]
//    var colMax = col[0]
//    var colMin = col[0]
//    for i in 0...row.count - 1 {
//        if row[i] > rowMax {
//            rowMax = row[i]
//        }
//
//        if row[i] < rowMin {
//            rowMin = row[i]
//        }
//
//
//
//    }
//
//    for i in 0...col.count - 1 {
//        if col[i] > colMax {
//            colMax = col[i]
//        }
//
//        if col[i] < colMin {
//            colMin = col[i]
//        }
//    }
//    result[0] = rowMin
//    result[1] = colMin
//    result[2] =  rowMax + 1
//    result[3] =  colMax + 1
//    */
//    print(result)
//
//
//    return result
//}

//solution(["..........", ".....#....", "......##..", "...##.....", "....#....."])
