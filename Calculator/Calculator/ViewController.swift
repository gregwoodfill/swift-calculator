//
//  ViewController.swift
//  Calculator
//
//  Created by Gregory Woodfill on 1/29/15.
//  Copyright (c) 2015 Woodfill Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var hasBeenSetPreviously = false
    
    var operandStack = Array<Double>()
    
    @IBAction func appendDigit(sender: UIButton) {
        if hasBeenSetPreviously {
           display.text = display.text! + sender.currentTitle!
        }
        else {
            hasBeenSetPreviously = true
            display.text = sender.currentTitle!
        }
    }
    
    @IBAction func enter() {
        hasBeenSetPreviously = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }

    }
    
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if hasBeenSetPreviously {
            enter()
        }
        switch operation {
            case "×": performOperation { $0 * $1 }
            case "÷": performOperation { $1 / $0 }
            case "+": performOperation { $0 + $1}
            case "−": performOperation { $1 - $0 }
            case "√": performOperation { sqrt($0) }
            default: break
            
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            hasBeenSetPreviously = false
        }
    }
}

