//
//  ViewController.swift
//  BindingMVVM
//
//  Created by 최수훈 on 2022/01/03.
//

import UIKit

class ViewController: UIViewController {

    private var loginVM = LoginViewModel()
    
    lazy var usernameTextField: UITextField = {
        let usernameTextField = BindingTextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = UIColor.lightGray
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.bind { [weak self] text in
            self?.loginVM.username.value = text
            
        }
        return usernameTextField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVM.username.bind { text in
            self.usernameTextField.text = text
        }
        
        setupUI()
    }
    
    @objc func login() {
        print(loginVM.username.value)
        print(loginVM.password.value)
    }
    
    @objc func fetchLoginInfo() {
        print("fetch Button")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.loginVM.username.value = "maryGold"
            self?.loginVM.password.value = "password"
        }
        
    }
    
    private func setupUI() {
        
        let usernameTextField = BindingTextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = UIColor.lightGray
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.bind { [weak self] text in
            self?.loginVM.username.value = text
        }
        
        let passwordTextField = BindingTextField()
        passwordTextField.isSecureTextEntry = true 
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind { [weak self] text in
            self?.loginVM.password.value = text
            
        }
        
        
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.gray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginInfoButton = UIButton()
        fetchLoginInfoButton.setTitle("FetchButton", for: .normal)
        fetchLoginInfoButton.backgroundColor = UIColor.blue
        fetchLoginInfoButton.addTarget(self, action: #selector(fetchLoginInfo), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,passwordTextField,loginButton, fetchLoginInfoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }


}

