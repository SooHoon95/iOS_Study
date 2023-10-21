//
//  ViewController.swift
//  Fontsizing Test
//
//  Created by 최수훈 on 2023/10/21.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    var label = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(label)
        self.view.addSubview(label2)
        self.view.addSubview(label3)

        label.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.centerY.equalTo(self.view).offset(-100)
//            $0.height.equalTo(60)
//            $0.width.equalTo(150)
        }
        
        label2.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.centerX.equalTo(label)
            $0.height.equalTo(60)
            $0.width.equalTo(150)
            
        }
        
        label3.snp.makeConstraints {
            $0.top.equalTo(label2.snp.bottom).offset(50)
            $0.centerX.equalTo(label2)
            $0.height.equalTo(60)
            $0.width.equalTo(150)
            
        }
        
        configLabel()
        
    }
    
    func configLabel() {
        label.do {
            $0.text = "Hello World"
            $0.backgroundColor = .blue
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20)
            $0.sizeToFit()
            //            $0.adjustsFontSizeToFitWidth = true
//            $0.minimumScaleFactor = 0.5
        }
        
        label2.do {
            $0.text = "adjustsFontSizeToFitWidth Test adjustsFontSizeToFitWidth Test"
            $0.backgroundColor = .yellow
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.font = .systemFont(ofSize: 15)
            $0.adjustsFontSizeToFitWidth = true
//            $0.minimumScaleFactor = 0.3
        }
        
        label3.do {
            $0.text = "adjustsFontSizeToFitWidth Test adjustsFontSizeToFitWidth Test"
            $0.backgroundColor = .yellow
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 15)
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.7
        }
    }
    


}

