import UIKit

// String 을 반환하는 클로저
let myName: String = {
    // myName으로 들어간다
    return "정대리"
}()

print(myName)// 이제서야 위에 코드 실행 됨.

// 클로저 정의
// 자료형 자체가 : (String) -> String 이게 되는거임 (String 을 받아서 String 을 뱉는 클로저가 됨)
let myRealName : (String) -> String = { (name: String) -> String in
    return "개발하는 \(name)"
}

myRealName("쩡대리")

//
let myRealNameLogic : (String) -> Void = { (name: String) in // String 을 받아서 아무것도 뱉지 않는다 (void)
    print("개발하는 \(name)")
}

myRealNameLogic("호로롤")
