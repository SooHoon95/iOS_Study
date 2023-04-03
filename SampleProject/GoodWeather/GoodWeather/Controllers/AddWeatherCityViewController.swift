//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Hyeon on 2022/01/02.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var citiNameTextField: UITextField!
    
    @IBAction func saceCityButtonPressed() {
        
    }
  
    
    
    //Close Button
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
