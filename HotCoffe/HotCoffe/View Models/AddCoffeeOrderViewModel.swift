//
//  AddCoffeeOrderViewModel.swift
//  HotCoffe
//
//  Created by Hyeon on 2021/12/30.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var coffeeName: [String] {
        return CoffeeType.allCases.map {
            $0.rawValue.capitalized
        }
    }
    var selectedType: String?
    var selectedSize: String?
    
    var total: Double?
    var size: [String] {
        return CoffeeSize.allCases.map {
            $0.rawValue.capitalized
        }
    }
}
