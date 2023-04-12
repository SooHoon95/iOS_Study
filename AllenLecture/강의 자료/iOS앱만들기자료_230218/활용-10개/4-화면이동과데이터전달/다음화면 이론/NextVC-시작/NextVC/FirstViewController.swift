//
//  FirstViewController.swift
//  NextVC
//
//  Created by 최수훈 on 2023/04/12.
//

import UIKit

class FirstViewController: UIViewController {

    let mainLable = UILabel()
    let backButton = UIButton(type: .custom)
    
    // 문자열을 전달 받을 변수
    // 보통 전달 받을 변수는 optional 아니면 생성자 만들어ㅜ저야하는데 번거러움
    var someString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        configureUI()
    }
    
    func setup() {
        view.backgroundColor = .gray
        mainLable.text = someString
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(mainLable)
        view.addSubview(backButton)
    }
    
    func configureUI() {
        
       
        
        mainLable.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:  -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            
            
        ])
        
        
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
