//
//  ViewController.swift
//  DiceGame
//
//  Created by Allen H on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    // 이미지리터럴 사용법의 변경
    // #imageLiteral(
    // 샵 이미지 L(대문자) 리터럴 소괄호열기
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
        
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
    }
    
    
    
    

}

