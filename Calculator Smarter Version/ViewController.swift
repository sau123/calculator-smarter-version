//
//  ViewController.swift
//  Calculator Smarter Version
//
//  Created by Saumeel Gajera on 10/18/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
/*
 1) Made use of stack view for auto layouting.
 2) modelled the brain of the calculator.
 */

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    private var userInMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton){
        let digit = sender.currentTitle!
        if userInMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userInMiddleOfTyping = true
    }
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }

    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    
    
    @IBAction func restore(){
        if savedProgram != nil{
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
   private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton){
     
        if userInMiddleOfTyping {
            brain.setOperand(displayValue)
            userInMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

