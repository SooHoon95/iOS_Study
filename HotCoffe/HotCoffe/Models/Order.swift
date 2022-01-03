//
//  Order.swift
//  HotCoffe
//
//  Created by 최수훈 on 2021/12/23.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
    case coldBrew
    case Hot_Coffee = "Hot Coffee"
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable{
    
//    let Body: String?
    let name: String
    let coffeeName: CoffeeType
    let total: Double
    let size: CoffeeSize
     
}

extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        return Resource<[Order]>(url:url)
    }()
    
    static func create(viewModel: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(viewModel)
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        var resouce = Resource<Order?>(url: url)
        resouce.httpMethod = HttpMethod.post
        resouce.body = data
        
        return resouce
    }
    
}

extension Order {
    
    init?(_ viewModel: AddCoffeeOrderViewModel) {
        guard let name = viewModel.name,
              let total = viewModel.total,
              let selectedType = CoffeeType(rawValue: viewModel.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: viewModel.selectedSize!.lowercased())
        else {
            return nil
        }
        
        self.name = name
        self.total = total
        self.coffeeName = selectedType
        self.size = selectedSize
        
    }
}
