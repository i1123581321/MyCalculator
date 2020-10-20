//
//  Calculator.swift
//  MyCalculator
//
//  Created by 钱正轩 on 2020/10/20.
//

import Foundation

class Calculator{
    var inputBuffer = InputBuffer()
    var register = 0.0
    
    func calculate(_ op:Operator) -> Double?{
        switch op{
        case let .input(symbol):
            inputBuffer.append(symbol)
        default:
            print("TODO...")
        }
        return inputBuffer.value
    }
}

struct InputBuffer{
    var hasDot = false
    var dotIndex = 0
    var buffer = ""
    
    
    var maxLen:Int{
        hasDot && dotIndex < 10 ? 11 : 10
    }
    
    var index:String.Index{
        if buffer.count >= maxLen{
            return buffer.index(buffer.startIndex, offsetBy: maxLen)
        } else {
            return buffer.endIndex
        }
    }
    
    var value:Double?{
        Double(buffer[..<index])
    }
    
    mutating func append(_ symbol:InputSymbol){
        switch symbol{
        case .dot:
            if !hasDot{
                dotIndex = buffer.count
                buffer += symbol.value
                hasDot = true
            }
        default:
            buffer += symbol.value
        }
        print("Real value: \(Double(buffer) ?? 0.0)")
        print("Get value: \(value ?? 0.0)")
    }
    
    mutating func reset(){
        buffer = ""
        hasDot = false
    }
}
