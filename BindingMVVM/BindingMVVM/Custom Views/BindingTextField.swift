//
//  BindingTextField.swift
//  BindingMVVM
//
//  Created by 최수훈 on 2022/01/03.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
             
        if let text = textField.text {
            textChanged(text)
            print(text)
        } else {
            print("textNO")
        }
        print("textFieldDidChanged")
    }
}
