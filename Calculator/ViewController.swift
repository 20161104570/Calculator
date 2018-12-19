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
        control = 0
        control_minus = 0
        number_storage = ""
        control_storage = 0
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
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control != 0){
            
            if(control_minus == 0) {
                number = "-" + number
                control_minus = 1
            }
            else {
                number.removeFirst() //除去第一
                control_minus = 0
            }
        }
        else{
            if(control_minus == 0) {
                dis.text = "-" + dis.text!
                control_minus = 1
            }
            else {
                dis.text?.removeFirst() //除去第一
                control_minus = 0
            }
        }
        
    }
    
    @IBAction func remove(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(dis.text == "-"){
            dis.text = ""
            number = ""
            control_minus = 0
        }
        else if(control == 0){
            
            if(dis.text?.last == "."){
                dis.text?.removeLast()// 数组尾端移除变量值
                number = dis.text!
                decimal = 0
            }
            else{
                dis.text?.removeLast()// 数组尾端移除变量值
                number = dis.text!
            }
        }
        else if(dis.text?.last == "*" && control_storage != 0){
            dis.text?.removeLast()// 数组尾端移除变量值
            control = 0
            number = number_one
            number_one = number_storage
            control = control_storage
             control_storage = 0
        }
        else if(dis.text?.last == "/" && control_storage != 0){
            dis.text?.removeLast()// 数组尾端移除变量值
            control = 0
            number = number_one
            number_one = number_storage
            control = control_storage
             control_storage = 0
        }
        else if(control != 0  && number == ""){
            
            dis.text?.removeLast()
            number = dis.text!
            symbol = ""
            control = 0
        }
        else{
            
            if(number.last == "."){
                number.removeLast()
                dis.text = number_one + symbol + number
                decimal = 0
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
                control_minus = 0
                dis.text = number_one + symbol
        }
        else if(control_storage != 0 && number != ""){
            if(control_storage == 1){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            //number = result
            number_one = result
            number = ""
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            control_storage = 0
            
        }
        else if(control == 1 && number == ""){
            result = "\(Double(number_one)! + Double(number_one)!)"
            number = result
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            
        }
        else if(control == 1 && number != ""){
            result = "\(Double(number_one)! + Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 2 && number != ""){
            result = "\(Double(number_one)! - Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
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
                control_minus = 0
                dis.text = number_one + symbol
            }
        else if(control_storage != 0 && number != ""){
            if(control_storage == 1 ){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            //number = result
            number_one = result
            number = ""
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            control_storage = 0
        
        }
        else if(control == 2 && number == ""){
            result = "\(Double(number_one)! - Double(number_one)!)"
            number = result
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            
        }
        else if(control == 1 && number != ""){
            result = "\(Double(number_one)! + Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 2 && number != ""){
            result = "\(Double(number_one)! - Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        

    }
    
    var number_storage = ""
    var control_storage = 0

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
                control_minus = 0
                dis.text = number_one + symbol
        }
        else if(control_storage != 0 && number != ""){
            if(control_storage == 1){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            number = result
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            control_storage = 0
        }
        else if(control == 3 && number == ""){
            result = "\(Double(number_one)! * Double(number_one)!)"
            number = result
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            
        }
       
           else if(control == 1 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 3
                number_one = number
                number = ""
                symbol = "*"
                decimal = 0
                dis.text = number_storage + "+" + number_one + symbol
            }
            else if(control == 2 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 3
                number_one = number
                number = ""
                symbol = "*"
                dis.text = number_storage + "-" + number_one + symbol
            }
            
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = number_one + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            number = ""
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
                control_minus = 0
                dis.text = number_one + symbol
            }
        
            
            else if(control == 1 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 4
                number_one = number
                number = ""
                symbol = "/"
                decimal = 0
                dis.text = number_storage + "+" + number_one + symbol
            }
            else if(control == 2 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 4
                number_one = number
                number = ""
                symbol = "/"
                dis.text = number_storage + "-" + number_one + symbol
            }
        
        else if(control_storage != 0 && number != ""){
            
            if (number == "0"){
                result = "错误,除数不为0"
            }
            else{
                if(control_storage == 1){
                    result = "\(Double(number_one)! / Double(number)!)"
                    result = "\(Double(number_storage)! + Double(result)!)"
                
                }
                else if(control_storage == 2){
                    result = "\(Double(number_one)! / Double(number)!)"
                    result = "\(Double(number_storage)! - Double(result)!)"
                }
                number = result
                number_one = result
                symbol = "/"
                control = 4
                decimal = 0
                control_minus = 0
                dis.text = result + symbol
                control_storage = 0
            }
        }
        
        else if(control == 4 && number == ""){
            result = "\(Double(number_one)! / Double(number_one)!)"
            number = result
            number_one = result
            symbol = "/"
            control = 4
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            
        }

        else if(control == 3 && number != ""){
            if (number == "0"){
                result = "错误,除数不为0"
                dis.text = result
            }
            else {
                result = "\(Double(number_one)! * Double(number)!)"
                number_one = result
                symbol = "/"
                control = 4
                decimal = 0
                control_minus = 0
                number = ""
                dis.text = number_one + symbol
            }
        }
        else if(control == 4 && number != ""){
            if (number == "0"){
                result = "错误,除数不为0"
                dis.text = result
            }
            else {
                result = "\(Double(number_one)! / Double(number)!)"
                number_one = result
                symbol = "/"
                control = 4
                decimal = 0
                control_minus = 0
                number = ""
                dis.text = number_one + symbol
            }
        }
        
       
    }
    @IBAction func ca(_ sender: UIButton) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        else if(control == 0)
        {
            dis.text = dis.text
        }
        else if(number == ""){
            dis.text = number_one + symbol
        }
        else if(control_storage != 0 && number != "")
        {
            if(control == 3)
            {
                if(control_storage == 1){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
                }
                if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
                }
                //number_one = ""
                dis.text = result
                number = result
                //decimal = 0
                control = 0
                symbol = ""
                control_storage = 0
            }
            else if(control == 4)
            {
                if(control_storage == 1){
                    result = "\(Double(number_one)! / Double(number)!)"
                    result = "\(Double(number_storage)! + Double(result)!)"
                    
                }
                if(control_storage == 2){
                    result = "\(Double(number_one)! / Double(number)!)"
                    result = "\(Double(number_storage)! - Double(result)!)"
                }
                //number_one = ""
                dis.text = result
                number = result
                //decimal = 0
                control = 0
                symbol = ""
                control_storage = 0
            }
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
            
            //number_one = ""
            dis.text = result
            number = result
            //decimal = 0
            control = 0
            symbol = ""
        }
        
    }
    
}
