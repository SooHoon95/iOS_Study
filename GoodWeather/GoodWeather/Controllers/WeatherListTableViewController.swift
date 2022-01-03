//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Hyeon on 2022/01/02.
//

import Foundation
import UIKit


class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // want large title // when disappear large title , the small one will appear
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //tableView Settings
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell Settings
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! Weathercell
        
        cell.cityNameLable?.text = "Houston"
        cell.temperateLable?.text = "70°"
        
        return cell
    }
}
