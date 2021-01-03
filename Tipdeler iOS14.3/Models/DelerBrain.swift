//
//  DelerBrain.swift
//  Tipdeler iOS14.3
//
//  Created by Hans Aangeenbrug on 03/01/2021.
//

import Foundation

struct DelerBrain {
    var bill: Bill?
    
    mutating func BerekenDeel(total: Float, tip: Float, human: Int) {
        let partValue = total * (1.0 + tip) / Float(human)
        
        bill = Bill(equalPart: partValue, totalBill: total, tipValue: tip, numberPeople: human)
    }
    
    func getDeel() -> Float {
        return bill?.equalPart ?? 0.0
    }
    
    func getTotal() -> Float {
        return bill?.totalBill ?? 0.0
    }
    
    func getTip() -> Float {
        return bill?.tipValue ?? 0.0
    }
    
    func getMens() -> Int {
        return bill?.numberPeople ?? 2
    }
}
