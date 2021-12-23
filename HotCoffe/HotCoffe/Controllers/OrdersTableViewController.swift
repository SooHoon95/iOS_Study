//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by 최수훈 on 2021/12/21.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL was incorrect")
            return
        }
        //Need to create orders
        
        let resource  = Resource<[Order]>(url: coffeeOrdersURL)
        
        WebService().load(resource: resource) { result in
            
            switch result {
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
            
        }
    }
}
