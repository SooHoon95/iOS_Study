//
//  ViewController.swift
//  UpDownGame
//
//  Created by Allen H on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var numberSelectedLabel: UILabel!
    
    var computerSelectedNum = Int.random(in: 1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceLabel.text = "선택하세요"
        numberSelectedLabel.text = ""
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 레이블에 선택된 숫자 표시
        let numString = sender.currentTitle!
        numberSelectedLabel.text = numString
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 선택하세요
        // 숫자레이블은 비어있는 상태로
        // 랜덤숫자 다시 선택
        introduceLabel.text = "선택하세요"
        numberSelectedLabel.text = ""
        computerSelectedNum = Int.random(in: 1...10)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let numString = numberSelectedLabel.text else {
            introduceLabel.text = "선택되지 않았어요"
            return
        }
        guard let mySelectedNum = Int(numString) else {
            introduceLabel.text = "선택되지 않았어요"
            return
        }
        
        
        if computerSelectedNum > mySelectedNum {
            introduceLabel.text = "UP"
        } else if computerSelectedNum < mySelectedNum {
            introduceLabel.text = "DOWN"
        } else {
            introduceLabel.text = "BINGO😄"
        }
    }
}

