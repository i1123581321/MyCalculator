//
//  Calculator.swift
//  MyCalculator
//
//  Created by 钱正轩 on 2020/10/20.
//

import Foundation

class Calculator{
    var inputBuffer = InputBuffer()
    var mainRegister = 0.0
    
    
    func calculate(_ op:Operator) -> Double{
        switch op{
        case let .input(symbol):
            inputBuffer.append(symbol)
            mainRegister = inputBuffer.value ?? Double.nan
        default:
            print("TODO...")
        }
        return mainRegister
    }
}

struct InputBuffer{
    var hasDot = false
    var buffer = ""
    
    var value:Double?{
        Double(buffer)
    }
    
    mutating func append(_ symbol:InputSymbol){
        switch symbol{
        case .dot:
            if !hasDot{
                buffer += symbol.value
                hasDot = true
            }
        default:
            buffer += symbol.value
        }
        print(Double(buffer) ?? "0.0")
    }
    
    mutating func reset(){
        buffer = ""
        hasDot = false
    }
}
