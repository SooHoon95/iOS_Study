//
//  ViewController.swift
//  BMI
//
//  Created by 최수훈 on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    // MARK: - Model
    var bmiManager = BMICalculateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        weightTF.delegate = self
        heightTF.delegate = self
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        
        heightTF.placeholder = "cm단위로 입력해주세요"
        weightTF.placeholder = "kg단위로 입력해주세요"
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {

        // BMI 결과값
        
        guard let height = heightTF.text else { return }
        guard let weight = weightTF.text else { return }
        
        bmiManager.calculateBMI(height: height, weight: weight)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 넘어갈지 말지
        if heightTF.text == "" || weightTF.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!"
            mainLabel.textColor = UIColor.red
            return false
        } else {
            mainLabel.text = "키와 몸무게를 입력해주세요"
            mainLabel.textColor = .black
            return true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //데이터전달
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmiResult = bmiManager.getBMIResult()
            secondVC.bmiColor = bmiManager.getBackgroundColor()
            secondVC.adviceString = bmiManager.getBMIAdviceString()
        }
        
        heightTF.text = ""
        weightTF.text = ""
    }
    
  
}

extension ViewController: UITextFieldDelegate {
    
    // 숫자만 입력 구현
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true // 글자 입력을 허용
        }
        return false
    }
    
    // 키 TF 엔터 -> 몸무게 TF -> 키보드 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 두개의 텍필 모두 종료 (키보드 내려가기)
        if heightTF.text != "", weightTF.text != "" {
            weightTF.resignFirstResponder()
            return true
        // 두번쨰 텍스트 필드로 넘어가도록
        } else if heightTF.text != "" {
            weightTF.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTF.resignFirstResponder()
        weightTF.resignFirstResponder()
    }
    
}
