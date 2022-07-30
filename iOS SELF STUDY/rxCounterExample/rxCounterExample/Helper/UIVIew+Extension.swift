//
//  UIVIew+Extension.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/07/16.
//

import UIKit

extension UIView {
    func addSubvies(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
        }
    }
    
    enum BorderDirection {
        case top
        case right
        case bottom
        case left
    }
}
