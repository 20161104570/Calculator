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
    var control:Int = 0
    var control_minus:Int = 0
    var number_one:String = ""
    var NumberOfCalculate:Int = 0
    
    @IBAction func app(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        
        if userIsInTheMiddleOfTypingANumber{
            dis.text = dis.text! + digit!
        }
        else{
            dis.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        if number_one != "" && NumberOfCalculate == 1 && dis.text != "" && dis.text != "" {
            dis.text = ""
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        dis.text = "0"
    }
    
    @IBAction func point(_ sender: Any) {
        dis.text = dis.text! + "."
    }
    
    @IBAction func minus(_ sender: Any) {
        if control_minus == 0 {
            dis.text = "-" + dis.text!
            control_minus = 1
        }
        else {
            dis.text?.removeFirst()
            control_minus = 0
        }
    }
    
    @IBAction func addition(_ sender: Any) {
        control = 1
        number_one = dis.text!
        dis.text = ""
        NumberOfCalculate = 0
    }
    
    @IBAction func subtraction(_ sender: Any) {
        control = 2
        number_one = dis.text!
        dis.text = ""
        NumberOfCalculate = 0
    }
    
    @IBAction func multiplication(_ sender: Any) {
        control = 3
        number_one = dis.text!
        dis.text = ""
        NumberOfCalculate = 0
    }
    
    @IBAction func division(_ sender: Any) {
        control = 4
        number_one = dis.text!
        dis.text = ""
        NumberOfCalculate = 0
    }
    @IBAction func ca(_ sender: UIButton) {
        var strtemp:String = ""
        switch control {
        case 1 :
            strtemp = "\(Double(number_one)! + Double(dis.text!)!)"
        case 2 :
            strtemp = "\(Double(number_one)! - Double(dis.text!)!)"
        case 3 :
            strtemp = "\(Double(number_one)! * Double(dis.text!)!)"
        case 4 :
            strtemp = "\(Double(number_one)! / Double(dis.text!)!)"
        default:
            strtemp = "0"
        }
        
        while (strtemp.last == "0"){
            strtemp.removeLast()
        }
        if (strtemp.last == "."){
            strtemp.removeLast()
        }
        dis.text = strtemp
        control = 0
        number_one = dis.text!
        NumberOfCalculate = NumberOfCalculate + 1
    }

}
    
    






