//
//  CodePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil
        )
    }
}
