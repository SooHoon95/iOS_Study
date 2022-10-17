//
//  ViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func tapCodePushBUtton(_ sender: UIButton) {
        // guard let 구문으로 optional 체이닝 해준다.
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else { return }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else { return }
        
        // present 뷰컨을 전체화면으로 띄운다.
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

