//
//  ViewController.swift
//  configTest
//
//  Created by 최수훈 on 10/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var flagBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func didTapBtn(_ sender: Any) {
//        self.configTest()
        multiConfigTest()
    }
    
    @IBAction func didTabFlagBtn(_ sender: Any) {
        flagTest()
    }
    
    
    func configTest() {
        #if RELEASE
            print(#function, "🚀🚀 RELEASE 🚀🚀")
        #endif
        
        #if HACK
            print(#function, "🚀🚀 HACK 🚀🚀")
        #endif
        
        #if DEBUG
            print(#function, "🚀🚀 DEBUG 🚀🚀")
        #endif

    }
    
    func multiConfigTest() {
        #if RELEASE
            print(#function, "🚀🚀 RELEASE 🚀🚀")
        #endif

        #if HACK
            print(#function, "🚀🚀 HACK 🚀🚀")
        #endif

        #if DEBUG
            print(#function, "🚀🚀 DEBUG 🚀🚀")
        #endif
        
        #if Debug
        print(#function, "🚀🚀 Debug 🚀🚀")
        #endif
        
        #if MULTI
            print(#function, "🚀🚀 MULTI 🚀🚀")
        #endif
    }
    
    
    
    func flagTest() {
        #if GLOBALFLAG1
            print(#function, "🚩🚩 Global 1 🚩🚩")
            #if HACKFLAG1
                print(#function, "🚩🚩HACKFLAG1 🚩🚩")
            #endif
        #endif
        
        #if HACKFLAG1
            print(#function, "🚩🚩HACKFLAG1 🚩🚩")
        #endif
        
        #if DEBUGFLAG1
            print(#function, "🚩🚩DEBUGFLAG1 🚩🚩")
        #endif
        
        #if DEBUGFLAG2
            print(#function, "🚩🚩DEBUGFLAG2 🚩🚩")
        #endif
    }
}


/*
 1. active compliaction conditions 를 수정하면 각 configuration을 #if 를 통해서 분기 처리 할 수 있도록 네이밍을 해준다.
 2. 특정 configuration에서 other swift flags 를 지정하면 #if 로 flag를 실행할 수 있다.
    -> config HACK 에서 active -- DEBUG 혹은 flag -- -DDEBUG 각각 추가했을 때 #if DEBUG 분기 타는 것을 확인했다.
 3. Project > build setting 에서 수정해도 target > build setting 에서 수정이 동적으로 반영이 안되므로 수동으로 반영해주어야 실행 시 원하는 대로 동작한다.
 */
