//
//  Member.swift
//  MemberList
//
//  Created by 최수훈 on 2023/04/26.
//

import UIKit

struct Member {
    
    
    lazy var memberImages: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    // MARK: - 타입저장속성 : 어떤하나의 인스턴스에 속해있는게 아니라 모든 인스턴스가 공유할 수 있는 인스턴스
    // 멤버의 (절대적) 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
   
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 생성자
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        // 0 인지 확인하고 타입저작속성의 절대 값으로 세팅(자동순번)
        self.memberId = Member.memberNumbers
        
        // 나머지는 저장속성은 외부에서 셋팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        print(Member.memberNumbers)
        Member.memberNumbers += 1
        
    }
}
