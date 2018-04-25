//
//  Calculator.swift
//  MyCalculator
//
//  Created by Mac User on 23.04.2018.
//  Copyright © 2018 Annie Alig. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    //MARK: Properties
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    //MARK: Initialization
    init(total:Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
    }
    
    //MARK: Methods
    func calcTipsWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTips = [0.15, 0.18, 0.20]
        
        var returnValue = [Int: Double] ()
        
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            
            returnValue[intPct] = calcTipsWithTipPct(tipPct: possibleTip)
        }
        return returnValue
    }
}
