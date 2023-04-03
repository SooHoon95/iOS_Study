//
//  ViewController.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/06/25.
//

import UIKit

class ViewController : BaseViewController<BaseViewModel> {
    private var counterView = CounterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterView.setup()
    }
    
    override func loadView() {
        self.view = counterView
    }
}
