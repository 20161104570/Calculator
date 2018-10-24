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
    
    var number_one:String = ""

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
        dis.text = "0"
    }
    
    @IBAction func point(_ sender: Any) {
        dis.text = dis.text! + "."
    }
    var control:Int = 0 //计算符号
    var control_minus:Int = 0 //正负号
    
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
    //remove
    @IBAction func remove(_ sender: Any) {
        
    }
    
    @IBAction func addition(_ sender: Any) {
        control = 1
        number_one = dis.text!
        dis.text = ""
        
    }
    
    @IBAction func subtraction(_ sender: Any) {
        control = 2
        number_one = dis.text!
        dis.text = ""
       
    }
    
    @IBAction func multiplication(_ sender: Any) {
        control = 3
        number_one = dis.text!
        dis.text = ""
        
    }
    
    @IBAction func division(_ sender: Any) {
        control = 4
        number_one = dis.text!
        dis.text = ""
       
    }
    @IBAction func ca(_ sender: UIButton) {
        var result:String = ""
        switch control {
        case 1 :
            result = "\(Double(number_one)! + Double(dis.text!)!)"
        case 2 :
            result = "\(Double(number_one)! - Double(dis.text!)!)"
        case 3 :
            result = "\(Double(number_one)! * Double(dis.text!)!)"
        case 4 :
            result = "\(Double(number_one)! / Double(dis.text!)!)"
        default:
            result = "0"
        }
        
        while (result.last == "0"){
            result.removeLast()
        }
        if (result.last == "."){
            result.removeLast()
        }
        dis.text = result
        control = 0
        number_one = dis.text!
      
    }

}
    
    






