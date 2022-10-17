//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapBackRootVCButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
