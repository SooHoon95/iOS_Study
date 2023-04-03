import UIKit


// private 은 scope 안에서만 값을 변경할 수 있다.
struct MyPet {

    var title :String = "타이틀없음"

    private (set) var name :String = "이름없음"

//    struct 안에서 name이라는 값을 변경하기 위해서 mutating 사용
    mutating func setName(to newName: String) {
        self.name = newName
        name = "123132"
    }
}

var myPet = MyPet()
//myPet.name 
//myPet.title
//myPet.title = "호롤롤로"
//myPet.title

//error: private.playground:44:7: error: cannot assign to property: 'name' setter is inaccessible
//myPet.name = "쩡대리"


myPet.setName(to: "쩡대리")
myPet.name


