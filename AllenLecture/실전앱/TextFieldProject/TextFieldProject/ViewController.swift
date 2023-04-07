//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 최수훈 on 2023/04/07.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        setUp()
        
    }

    func setUp() {
        view.backgroundColor = .gray
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .default
        
        textField.becomeFirstResponder()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    // 화면의 탭을 감지하는 메서드 in viewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }
    
}

extension ViewController : UITextFieldDelegate {
    
    // 텍스트 필드 입력 시작할 때 호출 ( 시작할지 말지 여부 허락 )
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // bool 리턴타입이 아니면 보통 -> 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 시작했다.")
    }
    
    // 텍스트 필드 글자 내용이 ( 한글자 한글자 ) 입력되거나 지워질 때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    // 텍스트 필드의 엔터키가 눌러지면 다음 동작 허락할 것?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트 필드의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 끝냈다.")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // 지우기 버튼 작동 안되게 막아놓음
        print(#function)
        return true
    }
}
