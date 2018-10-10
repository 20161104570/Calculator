//
//  ViewController.swift
//  Calculator
//
//  Created by 20161104570 on 2018/9/26.
//  Copyright © 2018年 20161104570. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UITextField!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func app(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit!
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation =  sender.currentTitle
        if userIsInTheMiddleOfTypingANumber{
            entrt()
        }
        switch operation {
        //case "+":
        //case "-":
        case "*":
            if operandStack.count >= 2{
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                entrt()
            }
            
        // case "/":
        default: break
        }
 
    }
    
    
    var operandStack = Array<Double>()
    @IBAction func entrt() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    var displayValue: Double{
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

