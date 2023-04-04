//
//  main.swift
//  RamdomBingoGame
//
//  Created by 최수훈 on 2023/04/04.
//

import Foundation

var comChoice = Int.random(in: 1...100)

var myChoice: Int = 0


while true {
    var userInput = readLine()
    
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    if comChoice > myChoice {
        print("Up")
    } else if comChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break
        // 반복문 종료!!
    }
}
