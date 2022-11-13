//
//  CodePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        if let name = name {
            self.label.text = name
        }
        label.sizeToFit()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
