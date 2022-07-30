//
//  RxbaseViewController.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/06/18.
//

import Foundation
import SnapKit
import UIKit

class CounterView: UIView {
    private let backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let valueLabel : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    private let increaseButton : UIButton = {
        let addButton = UIButton(type: .roundedRect)
        addButton.backgroundColor = .brown
        return addButton
    }()
    
    private let decreaseButton : UIButton = {
        let substractButton = UIButton(type: .roundedRect)
        substractButton.backgroundColor = .brown
        return substractButton
    }()
    
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .medium)
        return v
    }()
    
    func setup() {
        setupUI()
        setBind()
    }
}
    
    extension CounterView {
        private func setupUI() {
            addSubViews()
            setLayout()
        
        }
        
        private func setBind() {
            // delegate, datasource
        }
        
        private func addSubViews() {
            self.addSubview(self.backgroundView)
        
        self.backgroundView.addSubview(self.valueLabel)
        
        self.backgroundView.addSubview(self.increaseButton)
        
        self.backgroundView.addSubview(self.decreaseButton)
        
        self.backgroundView.addSubview(self.activityIndicatorView)
    }
    
    private func setLayout() {
        self.backgroundView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        self.valueLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.edges.equalTo(45)
        }
        
        self.increaseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-30)
            $0.width.edges.equalTo(45)
        }
        
        self.decreaseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(30)
            $0.width.height.equalTo(45)
        }
        
        self.activityIndicatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(valueLabel).offset(30)
            $0.width.height.equalTo(45)

        }
    }
}
