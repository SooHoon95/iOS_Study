//
//  main.swift
//  RandomBingo
//
//  Created by Allen H on 2021/01/11.
//

import Foundation


var computerChoice = Int.random(in: 1...100)    // 랜덤값 선택
var myChoice: Int = 0



while true {  // 계속 다시 실행의 의미
    // 유저가 입력하는 값을 읽기
    let userInput = readLine()
    
    // 유저가 읽은 값을 정수로 변환한뒤에
    // if let 바인딩
    if let userChoice = Int(userInput!) {
        myChoice = userChoice
    }
    
    // Up / Down / Bingo 판결
    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break            // Bingo인 경우, 실행 종료
    }
}




