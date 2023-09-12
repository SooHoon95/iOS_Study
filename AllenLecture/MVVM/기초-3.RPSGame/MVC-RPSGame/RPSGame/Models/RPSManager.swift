//
//  RPSManager.swift
//  RPSGame
//
//  Created by Allen H on 2021/12/12.
//

import Foundation

struct RPSManager {
    
    func getRpsResult(comChoice: Rps, myChoice: Rps) -> String {
        if comChoice == myChoice {
            return "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            return "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            return "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
}
