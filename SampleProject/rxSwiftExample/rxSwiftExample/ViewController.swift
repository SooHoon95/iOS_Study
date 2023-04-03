//
//  ViewController.swift
//  rxSwiftExample
//
//  Created by Hyeon on 2022/03/09.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class ViewController : UIViewController {

    let myView = UIView()
    let idTextField = UITextField()
    let pwTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myView)
        pwTextField.isSecureTextEntry = true
        myView.backgroundColor = .green
        idTextField.backgroundColor = .red
        pwTextField.backgroundColor = .blue
        setView()
    }

    private func attribute() {
        
    }
    private func setView() {
        myView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(additionalSafeAreaInsets)
        }
        
        myView.addSubview(idTextField)
        myView.addSubview(pwTextField)
        
        idTextField.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(40)
        }

        pwTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(40)
        }

        
    }
    

}

