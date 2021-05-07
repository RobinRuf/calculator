//
//  RoundButton.swift
//  Calculator
//
//  Created by Robin Ruf on 10.12.20.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton == true {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton == true {
            layer.cornerRadius = frame.height / 2
        }
    }

}
