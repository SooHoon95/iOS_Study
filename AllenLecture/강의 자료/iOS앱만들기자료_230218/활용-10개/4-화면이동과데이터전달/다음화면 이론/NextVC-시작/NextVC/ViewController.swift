//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        // 일단 인스턴스 생성하니까 메모리에 올라감
        let firstVC = FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.someString = "안녕하세요우"
        
        /*
         storyboard 에서는 이런 방식은 에러난다 why? 실제로는 스토리보드가 메모리에 나중에 올라가기 때문에
        firstVC.mainLabel 을 찾을 수 없기 때문.
        */
        //  firstVC.mainLable.text = "hihi"
        
        // modal 스타일
        present(firstVC, animated: true, completion: nil)
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        
//        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
//            present(secondVC, animated: true, completion: nil)
//        }

        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        
        secondVC.someString = "아빠상어"
        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.mainLabel.text = "123123"  // Error: - Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
        present(secondVC, animated: true, completion: nil)
        

        
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        // segue 활성화
        performSegue(withIdentifier: "toThirdVC", sender: self) // sender : 보내는 녀석
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "HIHI!!!"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "4th VC"
            print(123123)
        }
        
    }
    
    var num = 7
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(45456)
        // should -> 허락 -> 세그 실행할지 말지
        // 직접 세그웨이 방식일때만 실행 되는 메소드
        if num > 7 {
            return false
        } else {
            return true
        }
    }
    

    
}

