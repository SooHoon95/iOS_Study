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
    
    var bmi: Double?
    
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
        bmi = calculateBMI(height: height, weight: weight)
        
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
            secondVC.bmiResult = self.bmi
            secondVC.bmiColor = getBackgroundColor()
            secondVC.adviceString = getBMIAdviceString()
        }
        
        heightTF.text = ""
        weightTF.text = ""
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard
            let h = Double(height),
            let w = Double(weight) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
//        print("BMI Result: \(bmi)")
        return bmi
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
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
