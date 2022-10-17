//
//  CodePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
