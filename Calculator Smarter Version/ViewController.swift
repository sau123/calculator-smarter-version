//
//  ViewController.swift
//  Calculator Smarter Version
//
//  Created by Saumeel Gajera on 10/18/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userInMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton){
        let digit = sender.currentTitle!
        if userInMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userInMiddleOfTyping = true
    }
    
    @IBAction func performOperation(sender: UIButton){
        userInMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            if mathematicalSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }
}

