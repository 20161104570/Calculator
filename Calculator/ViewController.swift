//
//  ViewController.swift
//  Calculator
//
//  Created by 20161104570 on 2018/9/26.
//  Copyright © 2018年 20161104570. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var dis: UITextField!
   


    
    //var：定义一个变量 变量类型从右边推导而来
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func app(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        
        if userIsInTheMiddleOfTypingANumber{
            dis.text = dis.text! + digit!
        }
        else{
            dis.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        //dis.text = "0"
        
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        switch operation{
          
        case "×":
        case "÷":
        case "+":
        case "−":
        //case "√":
        default: break
            
        }
        
        
    }
    
    var operandStack = Array<Double>()
    
    //若用户点击enter，则将相应数字添加至数组Array中
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
    }
    var displayValue: Double {
        get{
            return NumberFormatter().number(from: dis.text!)!.doubleValue
        }
        set{
            dis.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}





