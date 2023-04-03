//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Allen H on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    

    // 해당 앱 화면에 진입했을때 가장 먼저 자동으로 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view.backgroundColor = UIColor.yellow
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // 컬러리터럴 사용법의 변경
        // #colorLiteral(
        // 샵 컬러 L(대문자) 리터럴 소괄호열기
        
        mainLabel.text = "안녕하세요"
        
    }
    
    
    

}

