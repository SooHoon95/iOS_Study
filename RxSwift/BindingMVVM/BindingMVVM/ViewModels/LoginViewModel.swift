//
//  LoginViewModel.swift
//  BindingMVVM
//
//  Created by 최수훈 on 2022/01/03.
//

import Foundation

class Dynamic<T> {
    
    typealias Listner = (T) -> Void
    var listner: Listner?
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    
    func bind(callback: @escaping (T) -> Void) {
        self.listner = callback
    }
    
    init(_ value: T) {
        self.value = value
    }
}

struct LoginViewModel {
    
    var username = Dynamic("")
    var password = Dynamic("")
}
