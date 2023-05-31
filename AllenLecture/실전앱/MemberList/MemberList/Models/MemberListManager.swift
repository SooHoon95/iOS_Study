//
//  MemberListManager.swift
//  MemberList
//
//  Created by 최수훈 on 2023/04/26.
//

import UIKit

// InterFace 라고생각하자.
final class MemberListManager {
 
    private var membersList: [Member] = []
    
    func makeMembersDatas() {
        
        membersList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-7777-7777", address: "켈리포니아"),
            Member(name: "베조스", age: 50, phone: "010-9999-9999", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-2332-232", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-4321-3214", address: "고담씨티"),
        ]
    }
    
    // 전체 리스트 리드
    func getMemberList() -> [Member] {
        return membersList
    }
    
    // 멤버 추가
    func makeNewMember(_ member: Member) {
        membersList.append(member)
    }
    
    // 디테일 업데이트
    func updateMemberInfo(index: Int, _ member: Member) {
        membersList[index] = member
    }
    
    // 특정 멤버 얻기 (굳이 필요없지만, 서브스크립트 구현해보기)
    subscript(index: Int) -> Member {
        get {
            return membersList[index]
        }
        set {
            membersList[index] = newValue
        }
    }
    
}
