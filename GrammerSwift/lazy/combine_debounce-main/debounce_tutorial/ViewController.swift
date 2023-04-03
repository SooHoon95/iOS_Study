//
//  ViewController.swift
//  debounce_tutorial
//
//  Created by Jeff Jeong on 2020/10/14.
//

import UIKit
import Combine

class ViewController: UIViewController {

    
    @IBOutlet var myLabel: UILabel!
    
    private lazy var searchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .black
        searchController.searchBar.searchTextField.accessibilityIdentifier = "mySearchBarTextField"
        return searchController
    }()
    
    var mySubscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.navigationItem.searchController = searchController
        searchController.isActive = true
        
        searchController.searchBar.searchTextField
            .myDebounceSearchPublisher
            .sink { [weak self] (receivedValue) in
                
                guard let self = self else { return }
                
                print("receivedValue: \(receivedValue)")
                self.myLabel.text = receivedValue
            }.store(in: &mySubscription)
        
    }
}

extension UISearchTextField {
    
    var myDebounceSearchPublisher : AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: self)
            // 노티피케이션 센터에서 UISearchTextField 가져옴
            .compactMap{ $0.object as? UISearchTextField }
            // UISearchTextField 에서 String 가져오기
            .map{ $0.text ?? "" }
            // 입력을 받기 때문에 RunLoop 그리고 메인 스레드에서
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            // 글자가 있을때만 반환
            .filter{ $0.count > 0 }
            .print()
            .eraseToAnyPublisher()
    }
    
}
