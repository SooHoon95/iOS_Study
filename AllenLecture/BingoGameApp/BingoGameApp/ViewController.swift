//
//  ViewController.swift
//  BingoGameApp
//
//  Created by 최수훈 on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNum: Int = Int.random(in: 1...10)
    // 초기화 0 이면 숫자 안누르고 버튼 누르면 에러가능성
    var myNum: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 메인 레이블에 안내 문구
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        
        // 컴퓨터의 랜덤숫자 선택하게하기
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        // 버튼 숫자 가져오기
        guard let numberString = sender.currentTitle else { return }
        
        // numberLabel이 숫자에 따라 변하기
        numberLabel.text = numberString
        
        // 선택한 숫자를 변수에 저장
        guard let num = Int(numberString) else { return }
        myNum = num
        
    }
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        // comNum vs myNum -> up? down? -> mainLabel
        
        if comNum > myNum {
            mainLabel.text = "Up"
        } else if comNum < myNum {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Bingo 😎"
        }
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        // comNum 다시 선택하도록
        comNum = Int.random(in: 1...10)
        // numLable = ""
        numberLabel.text = ""
    }
    

}

