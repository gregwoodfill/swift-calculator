//
//  ViewController.swift
//  Calculator
//
//  Created by Gregory Woodfill on 1/29/15.
//  Copyright (c) 2015 Woodfill Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var hasBeenSetPreviously: Bool = false
    
    @IBAction func setUiLabel(sender: UIButton) {
        if hasBeenSetPreviously {
           display.text = display.text! + sender.currentTitle!
        }
        else {
            hasBeenSetPreviously = true
            display.text = sender.currentTitle!
        }
    }
}

