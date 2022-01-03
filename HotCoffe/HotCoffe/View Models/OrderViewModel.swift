//
//  OrderViewModel.swift
//  HotCoffe
//
//  Created by 최수훈 on 2021/12/23.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
     
    func orderViewModel (at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

// 익스텐션 꼭 안하고 위에다 써도 된다.
extension OrderViewModel {
//
//    var Body: String? {
//        return self.order.Body
//    }
    
    var name: String {
        return self.order.name
    }

    var coffeeName: String {
        return self.order.coffeeName.rawValue.capitalized
    }

    var total: Double {
        return self.order.total
    }

    var size: String {
        return self.order.size.rawValue.capitalized
        
    }
}
