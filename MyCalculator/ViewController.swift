//
//  ViewController.swift
//  MyCalculator
//
//  Created by Mac User on 23.04.2018.
//  Copyright © 2018 Annie Alig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet weak var taxPctLabel: UILabel!
    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func calculateTapped(_ sender: Any) {
        tipsCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        let possibleTips = tipsCalc.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTextView.text = results
    }
    @IBAction func taxPercentageChanged(_ sender: Any) {
        tipsCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(_ sender: Any) {
        totalTextField.resignFirstResponder()
    }
    
    //MARK: Methods
    let tipsCalc = TipCalculatorModel(total:33.25, taxPct: 0.06)
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipsCalc.total)
        taxPctSlider.value = Float(tipsCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
}

