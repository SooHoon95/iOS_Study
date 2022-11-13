//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit
protocol SendDataWithSegueDelegate : AnyObject{
    func sendData(name:String)
}

class SeguePushViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var name: String?
    
    weak var delegate : SendDataWithSegueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.label.text = name
            self.label.sizeToFit()
        }

    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    
    }
    @IBAction func tapBackRootVCButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
