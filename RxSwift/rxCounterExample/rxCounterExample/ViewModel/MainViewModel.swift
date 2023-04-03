//
//  MainViewModel.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/24.
//

import RxCocoa

class MainViewModel: BaseViewModel {
    
    var count = 0
    var countBehaviorRelay = BehaviorRelay<Int>(value: 0)
    
    
    override init() {
        super.init()
    }
    
    
    func tapAddButton() {
        print("addbutton")
        countBehaviorRelay.accept(countBehaviorRelay.value + 1)
    }
    
    
    func tapSubscribeButton() {
        countBehaviorRelay.accept(countBehaviorRelay.value - 1)
    }
}
