//
//  CalculatorViewModel.swift
//  tip-calculator
//
//  Created by Jonetta Pek on 6/12/23.
//

import Foundation
import Combine

class CalculatorViewModel {
    
    private var cancellables = Set<AnyCancellable>()
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(input: Input) -> Output {
//        input
//            .billPublisher
//            .sink { bill in
//                print("the bill: \(bill)")
//            }
//            .store(in: &cancellables)
        
        input.tipPublisher.sink { tip in
            print("\(tip)")
        }.store(in: &cancellables)
        
        let result = Result(
            amountPerPerson: 50,
            totalBill: 500,
            totalTip: 50)
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
