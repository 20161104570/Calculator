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

    
    @IBAction func one(_ sender: Any) {
        dis.text = "1"
    }
    
    @IBAction func two(_ sender: Any) {
        dis.text = "2"
    }
    
    @IBAction func three(_ sender: Any) {
        dis.text = "3"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

