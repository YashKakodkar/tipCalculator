//
//  ViewController.swift
//  tipCalculator
//
//  Created by Yash Kakodkar on 1/21/19.
//  Copyright © 2019 Yash Kakodkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //setup segmented control
        let defaults = UserDefaults.standard
        tipSegmentedControl.setTitle("\(String(defaults.double(forKey: "firstDefault")*100))%", forSegmentAt: 0)
        tipSegmentedControl.setTitle("\(String(defaults.double(forKey: "secondDefault")*100))%", forSegmentAt: 1)
        tipSegmentedControl.setTitle("\(String(defaults.double(forKey: "thirdDefault")*100))%", forSegmentAt: 2)
        
        tipSegmentedControl.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billField.text!) ?? 0
        

        
        //calculate tip and total
        let defaults = UserDefaults.standard
        let tipPercentages = [defaults.double(forKey: "firstDefault"), defaults.double(forKey: "secondDefault"), defaults.double(forKey: "thirdDefault")]
        let tip = bill * tipPercentages[tipSegmentedControl.selectedSegmentIndex]
    
        
        let total = tip + bill
        //update tip and total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

