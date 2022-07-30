//
//  NotchView.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/09.
//

import UIKit

protocol NotchView {
    var topBackgroundColor : UIColor { get }
    var bottomBackgroundColor: UIColor { get }
    func topNotchView()
    func bottomNotchView()
    func allNotchView()
}

extension NotchView where Self: UIViewController {
    func allNotchView() {
        topNotchView()
        bottomNotchView()
    }
    
    func topNotchView() {
        let outOfSafeAreaView = UIView()
        outOfSafeAreaView.backgroundColor = topBackgroundColor
        view.addSubview(outOfSafeAreaView)
        outOfSafeAreaView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalTo(view.safeAreaLayoutGuide)
            maker.trailing.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    func bottomNotchView() {
        let outOfSafeAreaView = UIView()
        outOfSafeAreaView.backgroundColor = bottomBackgroundColor
        view.addSubview(outOfSafeAreaView )
        outOfSafeAreaView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            maker.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalToSuperview()
        }
    }
}
