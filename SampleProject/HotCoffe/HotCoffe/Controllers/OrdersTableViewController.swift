//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by 최수훈 on 2021/12/21.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeeOrderDelegate {
     
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
        print("ViewdidLoad")
    }
    
    //delegate funtions of AddCoffeeOrderDelegate
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
//        print("colse Button Protocol Adopted")
    }
    
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
        
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
//        print("OrdersTableViewController Adopt Protocol")
    }
    
    private func populateOrders() {
//        guard let coffeeOrdersURL = URL(string: "https://island-bramble.glitch.me/orders") else {
//            fatalError("URL was incorrect")
//        }
////        Need to create orders
//
//        let resource  = Resource<[Order]>(url: coffeeOrdersURL)
        print(1)
        WebService().load(resource: Order.all) { [weak self] result in // weak 왜??
            
            switch result {
                case .success(let orders):
                    print("=========")
                    self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                    self?.tableView.reloadData()
                    print("get Order Array Success")
                    print(orders)
                case .failure(let error):
                    print("get Order Array Fail")
                    print(error)
            }
            
            
        }
    }
    
    // Segue Way prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderNewController else {
                  fatalError("Error performing segue!")
              }
        
        
        addCoffeeOrderVC.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.coffeeName
        cell.detailTextLabel?.text = viewModel.size
        
        return cell
    }
    
}
