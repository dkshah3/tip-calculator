//
//  ViewController.swift
//  TipCalculator
//
//  Created by Dhrumil Shah on 2017-07-04.
//  Copyright © 2017 Dhrumil Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //outlets will show info, but won't really do anything
    @IBOutlet weak var billAmountField: UITextField!

    @IBOutlet weak var tipSelector: UISegmentedControl!
  
    @IBOutlet weak var tipAmountField: UITextField!
   
    @IBOutlet weak var totalAmountField: UITextField!

    
    //a function/action will do something with the info
    @IBAction func calculateTip(_ sender: Any) {
        
        //the user might insert a int and not a double, but money includes cents and is double, so putting double(billamountfield) will make sure the input is a double
        if let billAmount = Double(billAmountField.text!) {
            
           //this is a switch-case. first, you have a manipulated variable that you assign a value to (in this case 0). Then, you switch this value into different cases.
            
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
          
            //first round the bill amount, and then multiply by tip percentage to find the tipamount. Then, round the tipamount. Add the rounded bill amount and rounded tip amount to find the total amount.
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount

            
            //edit the bill amount (which the user enters) to make sure it has two decimals
                if (!billAmountField.isEditing) {
                    billAmountField.text = String(format: "%.2f", roundedBillAmount)
                    }
    
    
            //make sure tip amount and total amount have 2 decimals
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
            
            
            //if the texts are in wrong format, then show error
                    } else {
                        //show error
                    billAmountField.text = ""
                    tipAmountField.text = ""
                    totalAmountField.text = ""
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

