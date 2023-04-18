//
//  SecondViewController.swift
//  BMI
//
//  Created by 최수훈 on 2023/04/12.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        makeUI()
    }
    
    private func makeUI() {
        
        
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = "\((bmi.value))"
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
      
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}
