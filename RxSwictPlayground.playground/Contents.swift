import UIKit
import RxSwift
import RxCocoa

let bag = DisposeBag()


//let subject = PublishSubject<String>()
//
//subject.onNext("Issue 1")
//
//subject.subscribe{ event in
//    print(event)
//}
//
//subject.onNext("Ussue 2")
//subject.onNext("Issue 3")
//
////subject.dispose()
//
//subject.onCompleted()
//
//subject.onNext("Issue 4")


//let subject = BehaviorSubject(value: "Inital Value")
//
////subject.onNext("Last Issue")
//
//
//subject.subscribe { event in
//    print(event)
//}
//
//subject.onNext("Issue 1")

//
//let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//subject.onNext("Issue 1")
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")
//
//subject.subscribe {
//    print($0)
//}
//
//subject.onNext("Issue 4")
//subject.onNext("Issue 5")
//subject.onNext("Issue 6")
//
//print("[Subscription 2] ")
//subject.subscribe{
//    print($0)
//}



// Variable
//
//let variable = Variable([String]())
//
//variable.value.append("Item 1")
//
//variable.asObservable()
//    .subscribe{
//        print($0)
//    }
//
//variable.value.append("Item 2")



// BehaviorRelay

let relay = BehaviorRelay(value: ["Item 1"])


var value = relay.value

value.append("Item 2")
value.append("Item 3")
value.append("Item 4")

relay.accept(value)

//relay.accept(relay.value + ["Item 2 "])

relay.asObservable()
    .subscribe{
        print($0)
    }

//relay.value = "Hello World" // X /

//relay.accept("Hello World") // relay는 subscribe랑 다르게 .accept를 사용한다. 사용해서 데이터를... ____한다
