//
//  BMICalculateManager.swift
//  BMI
//
//  Created by 최수훈 on 2023/04/12.
//

import UIKit


struct BMICalculateManager {    // class 로 사용가능 -> mutating 필요 x
    
    var bmi: Double?
    
    // ** mutating : struct 내에서 인스턴스 수정
    mutating func calculateBMI(height: String, weight: String) {
        guard
            let h = Double(height),
            let w = Double(weight) else {
                bmi = 0.0
                return }
        var bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10
        //print("BMI Result: \(bmi)")
    }
    
    func getBMIResult() -> Double {
        
        return bmi ?? 0.0
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
    private var bmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        
        //BMI만들기 메서드 호출
        calculateBMI(height: height, weight: weight)
        //BMI 리턴
        return bmi ?? BMI(value: 0.0, matchColor: .white, advice: "문제발생")
    }
    
    mutating func calculateBMI(height: String, weight: String) {
        
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, matchColor: .white, advice: "문제발생")
            return
        }
        
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10
        
        switch bmiNumber {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            bmi = BMI(value: bmiNumber, matchColor: color, advice: "저체중")
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            bmi = BMI(value: bmiNumber, matchColor: color, advice: "표준")
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            bmi = BMI(value: bmiNumber, matchColor: color, advice: "저도비만")
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            bmi = BMI(value: bmiNumber, matchColor: color, advice: "중도비만")
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            bmi = BMI(value: bmiNumber, matchColor: color, advice: "고도비만")
            
        default:
            bmi = BMI(value: 0.0, matchColor: .white, advice: "문제발생")
        }
    }
    
    
}





