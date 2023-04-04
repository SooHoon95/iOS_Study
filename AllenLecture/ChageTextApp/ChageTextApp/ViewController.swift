//
//  ViewController.swift
//  ChageTextApp
//
//  Created by 최수훈 on 2023/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        mainLabel.text = "안녕하세요"
//        myButton.backgroundColor = .yellow
//        myButton.setTitleColor(.black , for: .disabled)
//        print(123)
//        mainLabel.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
//        mainLabel.textColor = .white
//        mainLabel.textAlignment = .right
//        mainLabel.textAlignment = NSTextAlignment.right
    }
    
    
    
    
}
