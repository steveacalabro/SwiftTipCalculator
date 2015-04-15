//
//  ViewController.swift
//  TipCalculator
//
//  Created by Stephen Calabro on 4/15/15.
//  Copyright (c) 2015 Stephen Calabro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percntage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
    
    //Actions
    @IBAction func calculateTapped(sender : AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var keys = Array(possibleTips.keys)
        sort(&keys)
        
        var results = ""
        for tipPct in keys {
            let tipVal = possibleTips[tipPct]!
            let prettyTip = String(format: "%.2f", tipVal)
            
            results += "\(tipPct)%: $\(prettyTip)\n"
        }
        
        resultsTextView.text = results;
        
        totalTextField.resignFirstResponder()
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

