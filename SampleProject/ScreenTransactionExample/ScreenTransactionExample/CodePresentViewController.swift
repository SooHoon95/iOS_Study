//
//  CodePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

// protocol 정의
protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    var name : String?
    // delegate 정의할때는 반드시 weak로 선언한다.
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.label.text = name
        }
        label.sizeToFit()
    }


    @IBAction func backButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "123123")
        self.presentingViewController?.dismiss(animated: true, completion: nil
        )
    }
}
