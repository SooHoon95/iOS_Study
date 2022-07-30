//
//  BaseViewModel.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/09.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewModel: HasDisposebag {
    let bag = DisposeBag()
    
    let viewWillAppearRelay = PublishRelay<Void>()
    let viewDidAppearRelay = PublishRelay<Void>()
    let viewWillDisAppearRelay = PublishRelay<Void>()
    let viewDidDisAppearRelay = PublishRelay<Void>()
    
    let navigationPopToSelfRelay = PublishRelay<Void>()
    let navigationPopViewControllerRelay = PublishRelay<Void>()
    let navigationPushViewControllerRelay = PublishRelay<UIViewController?>()
    let presentViewControllerWithAnimationRelay = PublishRelay<UIViewController?>()
    let presentViewControllerNoAnimationRelay = PublishRelay<UIViewController?>()
    let dismissSelfWithAnimationRelay = PublishRelay<Void>()
    let dismissSelfNoAnimationRelay = PublishRelay<Void>()
    let dismissSelfAnimationClosureRelay = PublishRelay<(() -> Void)>()
    
    
    init () {
        baseBinding()
    }
    
    func baseBinding() {
        
    }
    
    func bindInnerViewModelPresentationBindingToSelf(_ innerViewModel: BaseViewModel) {
        innerViewModel.navigationPopToSelfRelay.bind(to: navigationPopToSelfRelay).disposed(by: bag)
        innerViewModel.navigationPopViewControllerRelay.bind(to: navigationPopViewControllerRelay).disposed(by: bag)
        
        innerViewModel.navigationPushViewControllerRelay.bind(to: navigationPushViewControllerRelay).disposed(by: bag)
        innerViewModel.presentViewControllerWithAnimationRelay.bind(to: presentViewControllerWithAnimationRelay).disposed(by: bag)
        innerViewModel.presentViewControllerNoAnimationRelay.bind(to: presentViewControllerNoAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfWithAnimationRelay.bind(to: dismissSelfWithAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfNoAnimationRelay.bind(to: dismissSelfNoAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfAnimationClosureRelay.bind(to: dismissSelfAnimationClosureRelay).disposed(by: bag)
    }

}
