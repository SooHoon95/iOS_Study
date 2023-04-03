//
//  ViewController.swift
//  SingletonPattern
//
//  Created by 최수훈 on 2023/04/01.
//

import UIKit

class Pet {
    static let shared = Pet()
    private init () {}
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 두개의 메모리 주소가 다름
        // 싱글톤은 이 두개를 같은 공간으로 사용한다는 아이디어
//        let myCat = Pet()
//
//        let myDog = Pet()
        
        // 이렇게 하면 메모리 주소가 같다.
        let myCat = Pet.shared
        
        let myDog = Pet.shared
        
        
    }


}

