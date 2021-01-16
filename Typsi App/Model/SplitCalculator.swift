//
//  SplitCalculator.swift
//  Typsi App
//
//  Created by Bramdont José García Aponte on 14/1/21.
//

import Foundation
struct SplitCalculator {
    var split: Split?
    
    mutating func calculate(total: Float, tip: Int, quantity: Int) {
        let percentage = (Float(tip) * total) / 100
        let newTotal = total + percentage
        let result = newTotal / Float(quantity)
        
        split = Split(grandTotal: total, quantity: quantity, tip: tip, value: result)
    }
    
    func getSplitResult() -> Float {
        let splitResult = split?.value ?? 0.0
        return splitResult
    }
}
