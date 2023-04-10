//
//  ViewController.swift
//  LoginViewSelf
//
//  Created by 최수훈 on 2023/04/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var stackView = UIStackView()
    let emailTextView = UIView()
    let emailTextField = UITextField()
    let emailTextLabel = UILabel()
    
    let passwordTextView = UIView()
    let passwordTextField = UITextField()
    let passwordLabel = UILabel()
    
    let secureButton = UIButton()
    
    var loginButton = UIButton()
    let resetPWButton = UIButton(type: .custom)
    
    let textViewHeight: CGFloat = 48

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }

    private func configureLayout() {
        
        view.backgroundColor = .black
        
        setDelegate()
        setAttribute()
        setLayout()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setAttribute() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        resetPWButton.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - stackView

        stackView.spacing = 18
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        // MARK: - emailTextView
        emailTextView.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        emailTextView.layer.cornerRadius = 5
        emailTextView.clipsToBounds = true
        
        
        // MARK: - emailLabel
        emailTextLabel.text = "이메일주소 또는 전화번호"
        emailTextLabel.font = UIFont.systemFont(ofSize: 18)
        emailTextLabel.textColor = .white
        
        // MARK: - emailTF
        emailTextField.backgroundColor = .clear
        emailTextField.textColor = .white
        emailTextField.tintColor = .white
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.spellCheckingType = .no
        emailTextField.keyboardType = .emailAddress
        emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        // MARK: - passwordTextView
        passwordTextView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        passwordTextView.layer.cornerRadius = 5
        passwordTextView.clipsToBounds = true
        
        // MARK: - passwordLabel
        passwordLabel.text = "비밀번호"
        passwordLabel.font = UIFont.systemFont(ofSize: 18)
        passwordLabel.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        
        // MARK: - passwordTF
        passwordTextField.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        passwordTextField.frame.size.height = 48
        passwordTextField.backgroundColor = .clear
        passwordTextField.textColor = .white
        passwordTextField.tintColor = .white
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearsOnBeginEditing = false
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        // MARK: - secureButton
        secureButton.setTitle("표시", for: .normal)
        secureButton.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        secureButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        secureButton.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
        // MARK: - loginButton
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // MARK: - resetPWButton
        resetPWButton.backgroundColor = .clear
        resetPWButton.setTitle("비밀번호 재설정", for: .normal)
        resetPWButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        resetPWButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    private func setLayout() {
        
        view.addSubview(stackView)
        view.addSubview(resetPWButton)
        
        stackView.addArrangedSubview(emailTextView)
        stackView.addArrangedSubview(passwordTextView)
        stackView.addArrangedSubview(loginButton)
        
        
        emailTextView.addSubview(emailTextField)
        emailTextView.addSubview(emailTextLabel)
        passwordTextView.addSubview(passwordTextField)
        passwordTextView.addSubview(passwordLabel)
        passwordTextView.addSubview(secureButton)
        
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(2)
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(8)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(2)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        secureButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(200)
        }
        
        resetPWButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
      
    }
    
    @objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func resetButtonTapped() {
        
        let alert = UIAlertController(title: "비밀번호 재설정", message: "비밀번호를 재설정 하시겠습니까?", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "확인", style: .default) { action in
            print("confirm")
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive) { action in
            print("cancel")
        }
        
        
        alert.addAction(confirm)
        alert.addAction(cancel)
    
        present(alert, animated: true, completion: nil)
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
                loginButton.backgroundColor = .black
                loginButton.isEnabled = false
                return
            }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
    
    @objc func loginButtonTapped() {
        self.view.endEditing(true)
        print("loginButtonTapped")
    }
}


extension ViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailTextView.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
            
            UIView.animate(withDuration: 0.3) { [self] in
                emailTextLabel.snp.updateConstraints {
                    $0.centerY.equalToSuperview().offset(-13)
                }
                emailTextLabel.superview?.layoutIfNeeded()
            }
            emailTextLabel.font = UIFont.systemFont(ofSize: 11)
        }
        
        if textField == passwordTextField {
            passwordTextView.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
            passwordLabel.font = UIFont.systemFont(ofSize: 11)
            
            UIView.animate(withDuration: 0.3) { [self] in
                passwordLabel.snp.updateConstraints {
                    $0.centerY.equalToSuperview().offset(-13)
                }
                passwordLabel.superview?.layoutIfNeeded()
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if textField == emailTextField {
            emailTextView.backgroundColor =  #colorLiteral(red: 0.168627451, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
            
            if emailTextField.text == "" {
                emailTextLabel.font = UIFont.systemFont(ofSize: 18)
                
                UIView.animate(withDuration: 0.3) { [self] in
                    emailTextLabel.snp.updateConstraints {
                        $0.centerY.equalToSuperview()
                    }
                    emailTextLabel.superview?.layoutIfNeeded()
                }
            }
            
        }
        
        if textField == passwordTextField {
            passwordTextView.backgroundColor =  #colorLiteral(red: 0.168627451, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
            passwordLabel.font = UIFont.systemFont(ofSize: 18)
            
            if passwordTextField.text == "" {
                
                UIView.animate(withDuration: 0.3) { [self] in
                    passwordLabel.snp.updateConstraints {
                        $0.centerY.equalToSuperview()
                    }
                    passwordLabel.superview?.layoutIfNeeded()
                }
            }
            
        }
    }
}

