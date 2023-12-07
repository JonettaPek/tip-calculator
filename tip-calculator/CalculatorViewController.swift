//
//  ViewController.swift
//  tip-calculator
//
//  Created by Jonetta Pek on 5/12/23.
//

import UIKit
import SnapKit
import Combine

class CalculatorViewController: UIViewController {
    
    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()

    private let calculatorViewModel = CalculatorViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
        bind()
    }

    private func bind() {
//        billInputView
//            .valuePublisher
//            .sink { bill in
//                print("bill: \(bill)")
//            }
//            .store(in: &cancellables)
        
        let input = CalculatorViewModel.Input(
            billPublisher: billInputView.valuePublisher,
            tipPublisher: tipInputView.valuePublisher,
            splitPublisher: Just(20).eraseToAnyPublisher())
        let output = calculatorViewModel.transform(input: input)
        
//        output
//            .updateViewPublisher
//            .sink { result in
//                print(">>> \(result)")
//            }
//            .store(in: &cancellables)
    }
    
    private func layout() {
        view.backgroundColor = ThemeColor.background
        
        view.addSubview(vStackView)
        
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+16)
        }
        
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }

}

