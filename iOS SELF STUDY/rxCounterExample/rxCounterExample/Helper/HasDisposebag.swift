//
//  HasDisposebag.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/09.
//

import RxSwift

protocol HasDisposebag {
    var bag: DisposeBag { get }
}
