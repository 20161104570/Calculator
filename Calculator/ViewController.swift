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
    
    //数字键
    @IBAction func app(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        //做小数点时在显示（dis.text）和数字记录（numbe）时都有记录
        //运算没有问题，但显示时会重复
        //代码 39 -- 65
        if(control == 0){
            dis.text = ""
        }
        
        if(control == 1){
            while(dis.text?.last != "+" && control != 0){
                dis.text?.removeLast()
            }
        }
        
        else if(control == 2){
            while(dis.text?.last != "-" && control != 0){
                dis.text?.removeLast()
            }
        }
        
        else if(control == 3){
            while(dis.text?.last != "*" && control != 0){
                dis.text?.removeLast()
            }
        }
        
        else if(control == 4){
            while(dis.text?.last != "/" && control != 0){
                dis.text?.removeLast()
            }
        }
        
        if userIsInTheMiddleOfTypingANumber{
           
            number = number + digit!
            dis.text! = dis.text! + number
            
        }
        else{
            
            number = digit!
             dis.text = dis.text! + number
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    //AC 归零
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
    
    //小数点
    @IBAction func point(_ sender: Any) {
        if(number == ""){
            number = "0"
            dis.text = number
        }
        if (decimal == 0)
        {
            number = number + "."
            dis.text = dis.text! + "."
            decimal = 1
        }
        
    }

    //正负号
    @IBAction func minus(_ sender: Any) {
        //和小数点问题一样，显示正负号有问题
        if(control_minus == 0) {
            
            if(control == 0){
                dis.text = ""
            }
            
            else if(control == 1){
                while(dis.text?.last != "+" && control != 0){
                    dis.text?.removeLast()
                }
            }
                    
            else if(control == 2){
                while(dis.text?.last != "-" && control != 0){
                    dis.text?.removeLast()
                }
            }
                    
            else if(control == 4){
                while(dis.text?.last != "*" && control != 0){
                    dis.text?.removeLast()
                }
            }
                    
            else if(control == 4){
                while(dis.text?.last != "/" && control != 0){
                    dis.text?.removeLast()
                }
            }
                
            number = "-" + number
            control_minus = 1
            dis.text = dis.text! + number
            
        }
        else {
            
            if(control == 0){
                dis.text?.removeFirst()
                number.removeFirst() //除去第一
                control_minus = 0
            }
            else if(control == 1){
                while(dis.text?.last != "+" && control != 0){
                    dis.text?.removeLast()
                }
                
                number.removeFirst() //除去第一
                dis.text = dis.text! + number
                control_minus = 0
            }
                
            else if(control == 2){
                while(dis.text?.last != "-" && control != 0){
                    dis.text?.removeLast()
                }
                
                number.removeFirst() //除去第一
                dis.text = dis.text! + number
                control_minus = 0
            }
                
            else if(control == 4){
                while(dis.text?.last != "*" && control != 0){
                    dis.text?.removeLast()
                }
                
                number.removeFirst() //除去第一
                dis.text = dis.text! + number
                control_minus = 0
            }
                
            else if(control == 4){
                while(dis.text?.last != "/" && control != 0){
                    dis.text?.removeLast()
                }
                
                number.removeFirst() //除去第一
                dis.text = dis.text! + number
                control_minus = 0
            }
        }
        
    }
    
    //退位
    @IBAction func remove(_ sender: Any) {
        
        if(dis.text == ""){
            dis.text = ""
        }
        //退位正负号规则不严谨和减号混合
        else if(dis.text == "-"){
            dis.text = ""
            number = ""
            control_minus = 0
        }
            
        else if(dis.text?.last == "."){
            dis.text?.removeLast()// 数组尾端移除变量值
            number.removeLast()
            decimal = 0
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
            symbol = ""
            control = 0
            number = number_one
        }
            
        else{
            number.removeLast()
            dis.text?.removeLast()
        }
        
    }
    
    //加号按钮
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
                dis.text = dis.text! + symbol
        }
        else if(control_storage != 0 && number != "" && control == 3){
            
            if(control_storage == 1){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            
            number_one = result
            number = ""
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            control_storage = 0
            
        }
        else if(control_storage != 0 && number != "" && control == 4){
            
            if(control_storage == 1){
                result = "\(Double(number_one)! / Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! / Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number_one = result
            number = ""
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
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
            dis.text = dis.text! + symbol
        }
        else if(control == 2 && number != ""){
            result = "\(Double(number_one)! - Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number_one = result
            symbol = "+"
            control = 1
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
   
    }
    
    //减号按钮
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
                dis.text = dis.text! + symbol
            }
        else if(control_storage != 0 && number != "" && control == 3){
            
            if(control_storage == 1){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! * Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            
            number_one = result
            number = ""
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            control_storage = 0
            
        }
        else if(control_storage != 0 && number != "" && control == 4){
            
            if(control_storage == 1){
                result = "\(Double(number_one)! / Double(number)!)"
                result = "\(Double(number_storage)! + Double(result)!)"
                
            }
            else if(control_storage == 2){
                result = "\(Double(number_one)! / Double(number)!)"
                result = "\(Double(number_storage)! - Double(result)!)"
            }
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number_one = result
            number = ""
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
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
            dis.text = dis.text! + symbol
        }
        else if(control == 2 && number != ""){
            result = "\(Double(number_one)! - Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            number_one = result
            symbol = "-"
            control = 2
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        

    }
    
    var number_storage = ""
    var control_storage = 0

    //乘号按钮
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
                dis.text = dis.text! + symbol
        }
        else if(control_storage != 0 && number != "" && control == 3){
            
            result = "\(Double(number_one)! * Double(number)!)"
            
            number_one = result
            number = ""
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            
        }
       
        else if(control_storage != 0 && number != "" && control == 4){
            
            result = "\(Double(number_one)! / Double(number)!)"
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number_one = result
            number = ""
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            
        }
           else if(control == 1 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 3
                number_one = number
                number = ""
                symbol = "*"
                decimal = 0
                dis.text = dis.text! + symbol
            }
            else if(control == 2 && number != ""){
                number_storage = number_one
                control_storage = control
                control = 3
                number_one = number
                number = ""
                symbol = "*"
                dis.text = dis.text! + symbol
            }
            
        else if(control == 3 && number != ""){
            result = "\(Double(number_one)! * Double(number)!)"
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        else if(control == 4 && number != ""){
            result = "\(Double(number_one)! / Double(number)!)"
            number_one = result
            symbol = "*"
            control = 3
            decimal = 0
            control_minus = 0
            number = ""
            dis.text = dis.text! + symbol
        }
        
    }
    
    //除号按钮
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
                dis.text = dis.text! + symbol
            }
        
        else if(control_storage != 0 && number != "" && control == 3){
            
            result = "\(Double(number_one)! * Double(number)!)"
            
            number_one = result
            number = ""
            symbol = "/"
            control = 4
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            
        }
            
        else if(control_storage != 0 && number != "" && control == 4){
            
            result = "\(Double(number_one)! / Double(number)!)"
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number_one = result
            number = ""
            symbol = "/"
            control = 4
            decimal = 0
            control_minus = 0
            dis.text = dis.text! + symbol
            
        }
            
        else if(control == 4 && number == ""){
            
            result = "\(Double(number_one)! / Double(number_one)!)"
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
            number = result
            number_one = result
            symbol = "/"
            control = 4
            decimal = 0
            control_minus = 0
            dis.text = result + symbol
            
        }
            
            else if(control == 1 && number != ""){
            
                if (number == "0"){
                    result = "错误,除数不为0"
                    dis.text = result
                }
                else {
                    number_storage = number_one
                    control_storage = control
                    control = 4
                    number_one = number
                    number = ""
                    symbol = "/"
                    decimal = 0
                    dis.text = dis.text! + symbol
                }
            }
            
            else if(control == 2 && number != ""){
            
                if (number == "0"){
                    result = "错误,除数不为0"
                    dis.text = result
                }
                else {
                    number_storage = number_one
                    control_storage = control
                    control = 4
                    number_one = number
                    number = ""
                    symbol = "/"
                    dis.text = dis.text! + symbol
                }
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
                dis.text = dis.text! + symbol
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
                dis.text = dis.text! + symbol
            }
            result = String(format: "%0.8f", Double(result)!)
            
            while (result.last == "0"){
                result.removeLast() // 数组尾端移除变量值
            }
            if (result.last == "."){
                result.removeLast()
            }
        }
    }
    
    //等号按钮
    @IBAction func ca(_ sender: UIButton) {
        //没有数字时，一个数字时，一个数字一个符号时
        if(control == 0 || number == "")
        {
            dis.text = dis.text
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
                
                    result = String(format: "%0.8f", Double(result)!)
                    
                    while (result.last == "0"){
                        result.removeLast() // 数组尾端移除变量值
                    }
                    if (result.last == "."){
                        result.removeLast()
                    }
                
                number_one = ""
                dis.text = result
                number = result
                decimal = 0
                control = 0
                symbol = ""
                control_storage = 0
            }
                
            else if(control == 4)
            {
                if (number == "0"){
                    result = "错误,除数不为0"
                }
                else{
                    if(control_storage == 1){
                        result = "\(Double(number_one)! / Double(number)!)"
                        result = "\(Double(number_storage)! + Double(result)!)"
                    
                    }
                    if(control_storage == 2){
                        result = "\(Double(number_one)! / Double(number)!)"
                        result = "\(Double(number_storage)! - Double(result)!)"
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
                    number_one = ""
                    dis.text = result
                    number = result
                    decimal = 0
                    control = 0
                    symbol = ""
                    control_storage = 0
                }
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
            
            number_one = ""
            dis.text = result
            number = result
            control = 0
            number_storage = ""
            control_storage = 0
            symbol = ""
            
        }
    }
}
