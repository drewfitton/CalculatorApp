//
//  CalculatorValues.swift
//  CalculatorApp
//
//  Created by drewf on 9/17/24.
//

import Foundation

class CalculatorValues: ObservableObject {
    @Published var value: String = "0"
    @Published var finishedTypingNumber: Bool = true
    @Published var acValue: String = "AC"
    var storedNumber: Double = 0.0
    var storedOperation: String = ""
    private var valueNum: Double {
        get {
            guard let number = Double(value) else {
                return 0
            }
            return number
        }
        set {
            if newValue.truncatingRemainder(dividingBy: 1) == 0 {
                value = String(Int(newValue))
            } else {
                value = String(newValue)
            }
        }
    }
    
    func toggleSign(_ operation: String) {
        finishedTypingNumber = true
        switch operation {
        case "+/-":
            if valueNum != 0 {
                if valueNum.truncatingRemainder(dividingBy: 1) == 0 {
                    valueNum *= -1
                } else {
                    valueNum *= -1
                }
            }
            storedNumber = valueNum
        case acValue:
            value = "0"
            acValue = "AC"
            storedNumber = valueNum
        case "%":
            valueNum *= 0.01
            storedNumber = valueNum
        case "=":
            compute(storedOperation)
        default:
            storedOperation = operation
            storedNumber = valueNum
        }
    }
    
    func toggleNumber(_ textValue: String) {
        if finishedTypingNumber {
            finishedTypingNumberClick(textValue)
        } else if textValue == "." {
            if !value.contains(".") {
                value.append(textValue)
            }
        } else {
            value.append(textValue)
        }
    }
    
    func finishedTypingNumberClick(_ textValue: String) {
        if textValue == "0" {
            finishedTypingNumber = true
        } else if textValue == "." {
            if value.last != "." {
                value = "0."
                acValue = "C"
                finishedTypingNumber = false
            }
        } else {
            value = textValue
            acValue = "C"
            finishedTypingNumber = false
        }
    }
    
    func compute(_ operation: String) {
        switch operation {
        case "×":
            valueNum = storedNumber * valueNum
        case "-":
            print(valueNum)
            print(storedNumber)
            valueNum = storedNumber - valueNum
        case "+":
            valueNum = storedNumber + valueNum
        case "÷":
            valueNum = storedNumber / valueNum
        default:
            valueNum = valueNum
        }
    }
}
