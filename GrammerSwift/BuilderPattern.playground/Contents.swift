import UIKit

// 디자인 패턴 -> 객체생성관련, 빌더관련, 행위관련
// swift design pattern 검색
// Builder pattern

struct Pet {
    var name: String? = nil
    var age: Int? = nil
    init(){}
    init(builder: SecondPetBuilder) {
        self.name = builder.name
        self.age = builder.age
    }
}

class SecondPetBuilder {
    
    var name: String? = nil
    var age: Int? = nil
    
    // 자기 자신을 매개변수로 넣는다
    typealias BuilderClosure = (SecondPetBuilder) -> ()
    
    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

class PetBuilder {
    private var pet: Pet = Pet()
    func withName(_ name: String) -> Self { // 자기 자신을 내뱉음 여기서 Self = Petbuilder
        pet.name = name
        return self
    }
    
    func withAge(_ age: Int) -> Self {
        pet.age = age
        return self
    }
    
    func build() -> Pet {
        return self.pet
    }
}

// 마지막에 build를 해줘야함
//let myPet = PetBuilder()
//    .withName("haha")
//    .withAge(10)
//    .build()

let myPet = PetBuilder()
    .withAge(10)
    .withName("haha")
    .build()

myPet

let petBuilder = SecondPetBuilder { builder in
    builder.name = "댕댕쓰"
    builder.age = 10
}

let mySecondPet = Pet(builder: petBuilder)
