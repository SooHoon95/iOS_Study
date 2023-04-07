//
//  ViewController.swift
//  TimerApp
//
//  Created by 최수훈 on 2023/04/06.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    // type = valueChanged -> 값이 바뀔때마다 이 함수를 호출
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(sender.value * 60)
        mainLabel.text = "\(number)초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초 지날 때 마다 무언가를 실행
        startTimer()
        
    }
    
    func startTimer() {
        timer?.invalidate()
        
        // 셀렉터 사용방법
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
//
        // 클로저 사용방법
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in

            if number > 0 {
                // do Something 반복하고싶은 코드
                number -= 1
                // slider도 줄이고 label 다시 쓰기
                mainLabel.text = "\(number) 초"
                slider.value = Float(number) / Float(60)
            } else {
                number = 0
            // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                stopTimer()


            }
        })
        
    }
    
    @objc func doSomethingAfter1Second() {
        
        if number > 0 {
            // do Something 반복하고싶은 코드
            number -= 1
            // slider도 줄이고 label 다시 쓰기
            mainLabel.text = "\(number) 초"
            slider.value = Float(number) / Float(60)
        } else {
            number = 0
            
            stopTimer()
        // 소리를 나게 해야함
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
            
        
        }

    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 슬라이더 가운데로 세팅
        number = 0
        stopTimer()
    }
    
    func stopTimer() {
        timer?.invalidate()
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
    }
    
}
