//
//  codebaseInitializerProtocol.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/02.
//

import Foundation

protocol CodeBaseInitializerProtocol {
    
    func codeBaseInitializer()
    
    func attribute()
    
    func layout()
    
    func bind()
}

extension CodeBaseInitializerProtocol {
    func codeBaseInitializer () {
        attribute()
        layout()
        bind()
    }
    
    func attribute() {
        
    }
    
    func layout() {
        
    }
    
    func bind() {
        
    }
}
