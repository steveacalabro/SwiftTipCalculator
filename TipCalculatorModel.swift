//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Stephen Calabro on 4/15/15.
//  Copyright (c) 2015 Stephen Calabro. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPCt(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTips  = [0.15, 0.18, 0.20]
        
        var retVal = [Int: Double]()
        
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retVal[intPct] = calcTipWithTipPCt(possibleTip)
        }
        
        return retVal
    }
}