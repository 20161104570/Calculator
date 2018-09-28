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
    
    @IBAction func entrt() {
        userIsInTheMiddleOfTypingANumber = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

