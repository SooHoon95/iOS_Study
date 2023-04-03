import UIKit

struct Pet {
    var name: String
    
//    init() {
//        name = "호호호"
//    }
    
    init(name : String = "123123") {
        self.name = name
    }
}

let myDog = Pet(name: "댕댕이")


extension Pet {
    
}
