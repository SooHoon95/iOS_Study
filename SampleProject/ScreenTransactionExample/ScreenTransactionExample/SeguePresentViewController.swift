//
//  SeguePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 최수훈 on 2022/10/17.
//

import UIKit

class SeguePresentViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
