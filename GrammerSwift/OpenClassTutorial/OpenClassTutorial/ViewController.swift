//
//  ViewController.swift
//  OpenClassTutorial
//
//  Created by 최수훈 on 2023/04/01.
//

import UIKit
import NewFeature


class MyUtils: Utils {
    override class func sayHello() {
        super.sayHello()
        print("nono") // 에러 -> 외부 소스에서 상속을 받을때 사용할 수 있기 위해서 open 을 사용해야한다.
    }
}

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MyUtils.sayHello()
        
    }


}

