//
//  AddOrderViewController.swift
//  HotCoffe
//
//  Created by 최수훈 on 2021/12/21.
//

import Foundation
import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave (order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}


class AddOrderNewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var delegate: AddCoffeeOrderDelegate?
    
    private var viewModel = AddCoffeeOrderViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextFile: UITextField!
    
    
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setupUI()
    }

    private func setupUI() {
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: self.viewModel.size)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    //tabelView
    
    //click and make mark
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.coffeeName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeNameTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.coffeeName[indexPath.row]
        return cell
    }
    
    // Close Button
    
    @IBAction func close() {
        
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
        print("AddViewController Close Button Clicked")
    }
    
    //Save Button
    
    @IBAction func save() {
       
        let name = self.nameTextField.text
        let total = self.emailTextFile.text

        
        let selectedSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Errornin selecting coffee!")
        }
        
        self.viewModel.name = name
        self.viewModel.total = Double(total!)
        self.viewModel.selectedSize = selectedSize
        self.viewModel.selectedType = self.viewModel.coffeeName[indexPath.row]
        
        // use this button using API
        
        WebService().load (resource: Order.create(viewModel: self.viewModel)) { result in
            print("Add Delegate Start")
            switch result {
            case .success(let order):

                if let order = order, let delegate = self.delegate {
                    print("success Case")
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
                print("AddOrderNewController Click Save Button")
                print(order)
            case .failure(let error):
                
//                print("add result Error: ", error)
                print(error)
            }
        }
        
    }
}

