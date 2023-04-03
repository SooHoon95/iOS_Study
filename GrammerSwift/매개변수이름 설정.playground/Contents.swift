import UIKit

// 함수, 메소드 정의
func myFunction(name: String) -> String { // String 반환하는 형태
    return "안녕하세요?! \(name)입니다!"
}

// 함수, 메소드 호출한다. call
myFunction(name: "Hyeon")


// 함수, 메소드 정의
func myFunctionSecond(with name: String) -> String {
    return "안녕하세요?! \(name)입니다!"
}

// 같은 메소드지만 이름을 바꿔서 매게변수에 넣을 수 있다.
myFunctionSecond(with: "혀혀혀혀니")


// 함수, 메소드 정의
func myFunctionThird(_ name: String) -> String { // String 반환하는 형태
    return "안녕하세요?! \(name)입니다!"
}

myFunctionThird("하하하하 ")


