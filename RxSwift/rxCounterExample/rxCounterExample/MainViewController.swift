//
//  ViewController.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/06/04.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class MainViewController: BaseViewController<MainViewModel> {
    
    // MARK : UIProperty
    let firstView = UIView()
    let countTextField = UITextField()
    let addButton = UIButton()
    let substractButton = UIButton()
    let buttonBarStackView = UIStackView()
    let stackViewFormWrraper = UIView()
    let constraintView = UIView()
    
    var count : Int = 0


    override func attribute() {
        buttonBarStackView.axis = .horizontal
        buttonBarStackView.spacing = 10
        buttonBarStackView.alignment = .fill
        buttonBarStackView.distribution = .fillEqually
        buttonBarStackView.translatesAutoresizingMaskIntoConstraints = false

//        countTextField.text = String(self.viewModel.count)
        countTextField.text = String(self.viewModel.countBehaviorRelay.value)
        countTextField.font = UIFont.systemFont(ofSize: 14)

        addButton.setTitle("add", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)

        substractButton.setTitle("minus", for: .normal)
        substractButton.setTitleColor(.blue, for: .normal)
        substractButton.backgroundColor = .white
    }
    
    override func layout() {
        view.addSubview(firstView)
               firstView.snp.makeConstraints {
                   $0.edges.equalToSuperview().inset(10)
               }
               setUpFirstView()
    }
    
    override func viewModelBinding() {
        tapAction()
    }
    
    override func viewBinding() {
    
    }

    
    func setUpFirstView() {
        firstView.addSubview(countTextField)
        firstView.addSubview(stackViewFormWrraper)
        stackViewFormWrraper.addSubview(buttonBarStackView)

        countTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        stackViewFormWrraper.snp.makeConstraints {
            $0.top.equalTo(countTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }


        buttonBarStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        setUpStackView()
    }

    func setUpStackView() {
        buttonBarStackView.addArrangedSubview(addButton)
        buttonBarStackView.addArrangedSubview(substractButton)

        addButton.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(substractButton.snp.leading).inset(-5.0)
                }

        substractButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(addButton.snp.trailing).inset(-5.0)
        }

    }

    func tapAction() {
//        addButton.rx.tap.bind {
//            self.count += 1
//            self.countTextField.text = String(self.count)
//            print("add button")
//
//        }
        
//        addButton.rx.tap
//            .bind(to: self.viewModel.countBehaviorRelay)
//            .disposed(by: bag)
        
        addButton.rx.tap
            .subscribe(onNext: { [ weak self ] result in
                guard let self = self else { return }
                self.viewModel.tapAddButton()
//                self.countTextField.text = String(self.viewModel.count.value + 2)
                self.countTextField.text = String(self.viewModel.countBehaviorRelay.value )
                print(result)
            })
            .disposed(by: bag)
        
        substractButton.rx
            .tap
            .subscribe(onNext: { [ weak self ] _ in
                guard let self = self else {return }
                self.viewModel.tapSubscribeButton()
                self.countTextField.text = String(self.viewModel.countBehaviorRelay.value)
            })
        
        
        
//        substractButton.rx.tap.bind {
//            self.count -= 1
//            self.countTextField.text = String(self.count)
//            print("minus button")
//        }
    }

}

