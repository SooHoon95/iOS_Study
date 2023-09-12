//
//  ViewController.swift
//  RPSGame
//
//  Created by Allen H on 2021/05/25.
//

import UIKit

class ViewController: UIViewController {

    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 가위바위보 게임(비즈니스 로직) 관리 위한 인스턴스
    var rpsManager = RPSManager()
    
    // 데이터를 뷰컨트롤러가 소유⭐️⭐️
    // 데이터 저장 위한 변수 (컴퓨터 선택/나의 선택)
    var comChoice: Rps = Rps.allCases[Int.random(in: 1...3)]
    var myChoice: Rps = Rps.allCases[Int.random(in: 1...3)]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getReady()
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        myChoice = selectedRPS(withString: title)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        comImageView.image = comChoice.rpsInfo.image
        comChoiceLabel.text = comChoice.rpsInfo.name

        myImageView.image = myChoice.rpsInfo.image
        myChoiceLabel.text = myChoice.rpsInfo.name
        
        mainLabel.text = rpsManager.getRpsResult(comChoice: self.comChoice, myChoice: self.myChoice)
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        getReady()
        comChoice = Rps.allCases[Int.random(in: 1...3)]
    }
    
    func getReady() {
        mainLabel.text = "선택하세요"
        
        comImageView.image = Rps.ready.rpsInfo.image
        comChoiceLabel.text = Rps.ready.rpsInfo.name
        
        myImageView.image = Rps.ready.rpsInfo.image
        myChoiceLabel.text = Rps.ready.rpsInfo.name
    }
    
    func selectedRPS(withString name: String) -> Rps {
        switch name {
        case "가위":
            return Rps.scissors
        case "바위":
            return Rps.rock
        case "보":
            return Rps.paper
        default:
            return Rps.ready
        }
    }

}

