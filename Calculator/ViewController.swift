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
    
    var number_one:String = ""//第一个数字

    var number = "" //输入
    
    var symbol = ""//符号
    
    var result:String = ""//结果
    
    var decimal = 0 //小数点计数
    
    var control:Int = 0 //计算符号
    
    var control_minus:Int = 0 //正负号
    
    @IBAction func app(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        
        if userIsInTheMiddleOfTypingANumber{
           
            number = number + digit!
            dis.text! = number
            
        }
        else{
            
            number = digit!
             dis.text = number
            userIsInTheMiddleOfTypingANumber = true
        }
        
        if(symbol != ""){
            dis.text = number_one + symbol + number
        }
        
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        dis.text = ""
        symbol = ""
        result = ""
        number = ""
        decimal = 0
    }
    
    @IBAction func point(_ sender: Any) {
        if(number == ""){
            number = "0"
            dis.text = number
        }
        if (decimal == 0)
        {
            number = number + "."
            dis.text = number
            decimal = 1
        }
        if(symbol != ""){
            dis.text = number_one + symbol + number
        }
        
    }

    
    @IBAction func minus(_ sender: Any) {
        
        if control_minus == 0 {
            dis.text = "-" + dis.text!
            control_minus = 1
        }
        else {
            dis.text?.removeFirst() //除去第一
            control_minus = 0
        }
        
    }
    
    @IBAction func remove(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else{
            dis.text?.removeLast()
            if(symbol == ""){
                number = dis.text!
            }
            else{
                number.removeLast()
                dis.text = number_one + symbol + number
            }
        }
        
    }
    
    @IBAction func addition(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control == 0){
                number_one = number
                number = ""
                symbol = "+"
                control = 1
                decimal = 0
                dis.text = number_one + symbol
        }
        
    }
    
    @IBAction func subtraction(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control == 0){
                number_one = number
                number = ""
                symbol = "-"
                control = 2
                decimal = 0
                dis.text = number_one + symbol
            }
       
    }
    
    @IBAction func multiplication(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control == 0){
                number_one = number
                number = ""
                symbol = "*"
                control = 3
                decimal = 0
                dis.text = number_one + symbol
        }
        
    }
    
    @IBAction func division(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control == 0){
                number_one = number
                number = ""
                symbol = "/"
                control = 4
                decimal = 0
                dis.text = number_one + symbol
            }
       
    }
    @IBAction func ca(_ sender: UIButton) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(number == ""){
            dis.text = number_one + symbol
        }
        else{
            switch control {
            case 1 :
                result = "\(Double(number_one)! + Double(number)!)"
            case 2 :
                result = "\(Double(number_one)! - Double(number)!)"
            case 3 :
                result = "\(Double(number_one)! * Double(number)!)"
            case 4 :
                if (number == "0"){
                    result = "错误,除数不为0"
                }
                else{
                    result = "\(Double(number_one)! / Double(number)!)"
                }
            default:
                result = "0"
            }
            
            if (result != "错误,除数不为0"){
                result = String(format: "%0.8f", Double(result)!)
            
                while (result.last == "0"){
                    result.removeLast() // 数组尾端移除变量值
                }
                if (result.last == "."){
                    result.removeLast()
                }
            }
        
            dis.text = result
            control = 0
            number_one = dis.text!
            control = 0
            symbol = ""
        }
        
    }
    
}
