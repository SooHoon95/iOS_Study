//
//  ViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit
import SemiModalViewController

class ViewController: UIViewController ,SendDataDelegate {
    func sendData(name: String) {
        <#code#>
    }
    

    @IBOutlet weak var nameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }

    @IBAction func tapCodePushBUtton(_ sender: UIButton) {
        // guard let 구문으로 optional 체이닝 해준다.
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        viewController.name = "sooHoon"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else { return }
        // present 뷰컨을 전체화면으로 띄운다.
        viewController.definesPresentationContext = true
        viewController.name = "slkajd;lfkj;lkj"

        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue 실행직전에 prepare 메소드 자동실행
        if let viewController = segue.destination as? SeguePushViewController{
            viewController.name = "456456"
        }
            
    }
    
    func sendDataWithSegue(name : String) {
        self.nameLable.text = name
        self.nameLable.sizeToFit()
    }
    
//    // delegate 함수 정의
//    func sendData(name: String) {
//        self.nameLable.text = name
//        self.nameLable.sizeToFit()
//    }
}


