//
//  ViewController.swift
//  RPSGame
//
//  Created by Allen H on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
    var comChoice = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "선택하세요"
        comImageView.image = UIImage(named: "ready.png")
        myImageView.image = UIImage(named: "ready.png")
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let select = sender.currentTitle!
        
        switch select {
        case "가위":
            myChoice = Rps(rawValue: 2)!
        case "바위":
            myChoice = Rps(rawValue: 0)!
        case "보":
            myChoice = Rps(rawValue: 1)!
        default:
            break
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        comImageView.image = UIImage(named: "ready.png")
        myImageView.image = UIImage(named: "ready.png")
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comChoice {
        case .rock:
            comImageView.image = UIImage(named: "rock.png")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = UIImage(named: "paper.png")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = UIImage(named: "scissors.png")
            comChoiceLabel.text = "가위"
        }
        
        switch myChoice {
        case .rock:
            myImageView.image = UIImage(named: "rock.png")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = UIImage(named: "paper.png")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = UIImage(named: "scissors.png")
            myChoiceLabel.text = "가위"
        }
        
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
}

