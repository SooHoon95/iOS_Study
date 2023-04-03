//
//  BaseViewController.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/06/25.
//
import Foundation
import RxSwift

class BaseViewController<ViewModel>: UIViewController, CodeBaseInitializerProtocol, NotchView, HasDisposebag where ViewModel: BaseViewModel {
    
    lazy var bag: DisposeBag = {
        self.viewModel.bag
    }()
    
    var viewModel: ViewModel
    
    var topBackgroundColor: UIColor {
        return .white
    }
    
    var bottomBackgroundColor: UIColor {
        return .white
    }
    
    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        /// initializer를 통해서 attribute(), layout(), bind() 가 호출된다. 상속 받은 VC 에서 override 만 하면 된다.
        codeBaseInitializer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        allNotchView()
        appStateBinding()
    }
    
    // MARK: - CodeBaseInitializerProtocol Function
    func attribute() {}
    
    func layout() {}
    
    func bind() {
        viewBinding()
        viewModelBinding()
    }
    
    func viewBinding() { }
    
    func viewModelBinding() {
        viewModel.navigationPopToSelfRelay
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.popToViewController(self , animated: true)
            })
            .disposed(by: bag)
        
        viewModel
            .navigationPopViewControllerRelay
            .subscribe(onNext: { [weak self ] _ in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: bag)
        
        viewModel
            .navigationPushViewControllerRelay
            .subscribe(onNext: { [ weak self ] viewController in
                guard let self = self, let viewController = viewController else { return }
                self.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: bag)
        
        viewModel
            .presentViewControllerWithAnimationRelay
            .subscribe(onNext: { [ weak self ] viewController in
                guard let self = self, let viewController = viewController else { return }
                self.present(viewController, animated: true)
            })
            .disposed(by: bag)
        
        viewModel
            .presentViewControllerNoAnimationRelay
            .subscribe(onNext: { [ weak self ] viewController in
                guard let self = self , let viewController = viewController else { return }
                self.present(viewController, animated: false)
            })
            .disposed(by: bag)
        
        viewModel
            .dismissSelfWithAnimationRelay
            .subscribe(onNext: { [ weak self ] _ in
                self?.dismiss(animated: true)
            })
            .disposed(by: bag)
        
        viewModel
            .dismissSelfNoAnimationRelay
            .subscribe(onNext: { [ weak self ] _ in
                self?.dismiss(animated: false)
            })
            .disposed(by: bag)
        
        viewModel.dismissSelfAnimationClosureRelay
            .bind { [ weak self ] closure in
                self?.dismiss(animated: true, completion: closure)
            }
            .disposed(by: bag)
    }
    
    private func appStateBinding() {
        
        self.rx
            .viewWillAppear
            .map { _ in Void() }
            .bind(to: viewModel.viewWillAppearRelay)
            .disposed(by: bag)
        
        self.rx
            .viewDidAppear
            .map { _ in Void() }
            .bind(to : viewModel.viewDidAppearRelay)
            .disposed(by: bag)
        
        self.rx
            .viewWillDisappear
            .map { _ in Void() }
            .bind(to: viewModel.viewWillDisAppearRelay)
            .disposed(by: bag)
        
        self.rx
            .viewDidDisappear
            .map { _ in Void() }
            .bind(to: viewModel.viewWillDisAppearRelay)
            .disposed(by: bag)
    }
    
    func bindInnerViewModelPresentationBindingToSelf(_ innerViewModel: BaseViewModel) {
        innerViewModel.navigationPopViewControllerRelay.bind(to: viewModel.navigationPopViewControllerRelay).disposed(by: bag)
        innerViewModel.navigationPushViewControllerRelay.bind(to: viewModel.navigationPushViewControllerRelay).disposed(by: bag)
        innerViewModel.presentViewControllerWithAnimationRelay.bind(to: viewModel.presentViewControllerWithAnimationRelay).disposed(by: bag)
        innerViewModel.presentViewControllerNoAnimationRelay.bind(to: viewModel.presentViewControllerNoAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfWithAnimationRelay.bind(to: viewModel.dismissSelfWithAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfNoAnimationRelay.bind(to: viewModel.dismissSelfNoAnimationRelay).disposed(by: bag)
        innerViewModel.dismissSelfAnimationClosureRelay.bind(to: viewModel.dismissSelfAnimationClosureRelay).disposed(by: bag)
    }
//    func setAttribute() {
//        buttonBarStackView.axis = .horizontal
//        buttonBarStackView.spacing = 10
//        buttonBarStackView.alignment = .fill
//        buttonBarStackView.distribution = .fillEqually
//        buttonBarStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        countTextField.text = String(count)
//        countTextField.font = UIFont.systemFont(ofSize: 14)
//
//        addButton.setTitle("add", for: .normal)
//        addButton.setTitleColor(.blue, for: .normal)
//
//        substractButton.setTitle("minus", for: .normal)
//        substractButton.setTitleColor(.blue, for: .normal)
//        substractButton.backgroundColor = .white
//    }
    
//    func setUpView() {
//        view.addSubview(firstView)
//        firstView.snp.makeConstraints {
//            $0.edges.equalToSuperview().inset(10)
//        }
//        setUpFirstView()
//    }
//
//    func setUpFirstView() {
//        firstView.addSubview(countTextField)
//        firstView.addSubview(stackViewFormWrraper)
//        stackViewFormWrraper.addSubview(buttonBarStackView)
//
//        countTextField.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
//        stackViewFormWrraper.snp.makeConstraints {
//            $0.top.equalTo(countTextField.snp.bottom).offset(20)
//            $0.leading.trailing.equalToSuperview().inset(10)
//        }
//
//
//        buttonBarStackView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        setUpStackView()
//    }
//
//    func setUpStackView() {
//        buttonBarStackView.addArrangedSubview(addButton)
//        buttonBarStackView.addArrangedSubview(substractButton)
//
//        addButton.snp.makeConstraints {
//            $0.top.leading.bottom.equalToSuperview()
//            $0.trailing.equalTo(substractButton.snp.leading).inset(-5.0)
//                }
//
//        substractButton.snp.makeConstraints {
//            $0.top.trailing.bottom.equalToSuperview()
//            $0.leading.equalTo(addButton.snp.trailing).inset(-5.0)
//        }
//
//    }
}
