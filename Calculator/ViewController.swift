//
//  ViewController.swift
//  Calculator
//
//  Created by Robin Ruf on 10.12.20.
//

import UIKit

class ViewController: UIViewController {
    
    // Ergebnis Anzeige
    @IBOutlet weak var resultLabel: UILabel!
    
    var userIsInTheMiddleOfTyping : Bool = false
    var decimalUsing : Bool = false
    
    var firstNumber : Double = 0.0
    var secondNumber : Double = 0.0
    var result : Double = 0.0
    var choosingOperator : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Nummer Buttons
    @IBAction func numberButton_Tapped(_ sender: RoundButton) {
        var key = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping == true {
            if decimalUsing == true && key == "." {
                key = ""
        }
            resultLabel.text = resultLabel.text! + key
        } else {
            resultLabel.text = key
            userIsInTheMiddleOfTyping = true
        }
        
        if key == "." {
            decimalUsing = true
        }
    }
    
    // Gleichzeichen Button
    @IBAction func equalButton_Tapped(_ sender: RoundButton) {
        secondNumber = Double(resultLabel.text!)!
        
        calculate(_operator: choosingOperator)
        
        resultLabel.text = String(format: "%.2f", result)
        
        userIsInTheMiddleOfTyping = false
        decimalUsing = false
    }
    
    // Löschen Button
    @IBAction func clearButton_Tapped(_ sender: RoundButton) {
        firstNumber = 0.0
        secondNumber = 0.0
        result = 0.0
        choosingOperator = ""
        resultLabel.text = "0"
        decimalUsing = false
    }
    
    // Operationsbuttons (Addition, Subtraktion, Multiplikation, Division, Prozent, Plus-Minus-Umkehr)
    @IBAction func operationsButton_Tapped(_ sender: RoundButton) {
        
        if resultLabel.text! != "." {
            firstNumber = Double(resultLabel.text!)!
            
            userIsInTheMiddleOfTyping = false
            choosingOperator = sender.currentTitle!
            decimalUsing = false
        }
        
        }
    
    func calculate(_operator: String) {
        switch _operator {
        case "+": result = firstNumber + secondNumber
        case "–": result = firstNumber - secondNumber
        case "x": result = firstNumber * secondNumber
        case "/": result = firstNumber / secondNumber
        default:
            break
        }
    }

}
