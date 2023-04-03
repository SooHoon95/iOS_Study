//
//  main.swift
//  URLSession Test
//
//  Created by Hyeon on 2022/05/15.
//

import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func testFunc(s1: String, s2: String) -> Bool {
    return s1 > s2
}

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
