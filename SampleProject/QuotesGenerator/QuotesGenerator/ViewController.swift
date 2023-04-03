//
//  ViewController.swift
//  QuotesGenerator

// Error Log: https://www.notion.so/mobdevsoohoon95/Error-af13892c1efb4fc9b69b3dd3cc47bacc

//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
    Quote(content: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다.", name: "벤다이크"),
    Quote(content: "나는 나 자신을 빼 놓고는 모두 안다.", name: "비용"),
    Quote(content: "편견이란 실효성이 없는 의견이다.", name: "암브로스 빌"),
    Quote(content: "분노는 바보들의 가슴속에서만 살아간다.", name: "아인슈타인"),
    Quote(content: "몇 번이라도 좋다 ! 이 끔찍한 생이여... 다시 !", name: "니체"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.textAlignment = .center
        nameLabel.textAlignment = .center
        
        nameLabel.font = .systemFont(ofSize: 17.0, weight: UIFont.Weight(rawValue: 600))
        
    }

    @IBAction func tapQuoteGeneratorBtn(_ sender: Any) {
        // 랜덤 난수 발생하는 함수
        let random = Int(arc4random_uniform(5)) // 0 ~ 4 사이의 난수를 만들어줌
        let quote = quotes[random]
        
        quoteLabel.text = quote.content
        nameLabel.text = quote.name
    }
    
}

