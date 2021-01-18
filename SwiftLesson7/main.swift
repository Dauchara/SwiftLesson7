//
//  main.swift
//  SwiftLesson7
//
//  Created by Ниязов Ринат Раимжанович on 1/17/21.
//

import Foundation

enum TestingError: Error {
    case devideByZero
    case lessZero
    case ArrayIsEmpty
    case outOfArray
}

class Testing {
    var Array: [Int] = []
    
    func addValue(_ value: Int) {
        Array.append(value)
    }
    
    func getValue(_ index: Int) -> (Int?, TestingError?) {
        guard !Array.isEmpty else {
            return (nil, TestingError.ArrayIsEmpty)
        }
        
        guard index >= 0, index <= Array.count else {
            return (nil, TestingError.outOfArray)
        }
        
        //return Array.first
        return (Array[index], nil)
    }
    
    func devide(_ valueA: Double, _ valueB: Double) throws -> Double {
        guard valueB != 0 else {
            throw TestingError.devideByZero
        }
        
        return valueA / valueB
    }
    
    func sqrt(_ value: Double) throws -> Double {
        guard value > 0 else {
            throw TestingError.lessZero
        }
        
        var temp: Double
        var squareRoot = value / 2
        repeat {
            temp = squareRoot
            squareRoot = (temp + (value / temp)) / 2
        } while (temp - squareRoot) != 0
        
        return squareRoot
    }
}

let testErrors = Testing()
var result = testErrors.getValue(2)

if let value = result.0 {
    print("Value = \(value)")
} else if let error = result.1 {
    print("Error: \(error.localizedDescription)")
}

testErrors.addValue(2)
testErrors.addValue(4)
testErrors.addValue(5)
testErrors.addValue(29)

result = testErrors.getValue(3)

if let value = result.0 {
    print("Value = \(value)")
} else if let error = result.1 {
    print("Error: \(error.localizedDescription)")
}


var valueA: Double = 10
var valueB: Double = 0

do {
    let devidedValue = try testErrors.devide(valueA, valueB)
    print(devidedValue)
} catch TestingError.devideByZero {
    print("Devide by zero")
} catch let error {
    print(error.localizedDescription)
}

do {
    let sqrtValue = try testErrors.sqrt(-9)
    print(sqrtValue)
} catch TestingError.lessZero {
    print("Value less zero")
} catch let error {
    print(error.localizedDescription)
}
