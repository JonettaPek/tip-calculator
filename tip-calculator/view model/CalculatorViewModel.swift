//
//  CalculatorViewModel.swift
//  tip-calculator
//
//  Created by Jonetta Pek on 6/12/23.
//

import Foundation
import Combine

class CalculatorViewModel {
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(input: Input) -> Output {
        let result = Result(
            amountPerPerson: 50,
            totalBill: 500,
            totalTip: 50)
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
