//
//  ViewController.swift
//  RPSGame
//
//  Created by 최수훈 on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         1. 이미지뷰에 준비이미지 띄우기
         2. choiceLabel 에 준비 텍스트 띄우기
         */
        setReady()
    }
    
    func setReady() {
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        // 가위 바위 보 선택해서 그 정보 저장
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            // 문자열이기 때문에 디폴트를 작성해야한다.
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1. 컴퓨터 랜덤선택 - 이미지, 텍스트
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        }
        
        // 2. 내 선택 - 이미지, 텍스트
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        }
        
        // 컴퓨터 선택 vs 내 선택 비교 -> 승부 판단 -> 표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper{
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
    // imageView에 준비 이미지로 변경, 텍스트 변경
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    // 메인 레이블 선택하세요로 변경
        mainLabel.text = "선택하세요"
    // 컴퓨터가 다시 랜덤 가위 바위 보 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    
}

