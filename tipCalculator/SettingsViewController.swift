//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Yash Kakodkar on 1/21/19.
//  Copyright © 2019 Yash Kakodkar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tipSlider1: UISlider!
    @IBOutlet weak var tipSlider2: UISlider!
    @IBOutlet weak var tipSlider3: UISlider!
    @IBOutlet weak var defaultControl: UISegmentedControl!
    
    
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //setup tip labels
        tip1Label.text = String(format: "%.2f%", defaults.double(forKey: "firstDefault"))
        tip2Label.text = String(format: "%.2f%", defaults.double(forKey: "secondDefault"))
        tip3Label.text = String(format: "%.2f%", defaults.double(forKey: "thirdDefault"))
        
        //setup segmented controls
        defaultControl.setTitle("\(String(defaults.double(forKey: "firstDefault")*100))%", forSegmentAt: 0)
        defaultControl.setTitle("\(String(defaults.double(forKey: "secondDefault")*100))%", forSegmentAt: 1)
        defaultControl.setTitle("\(String(defaults.double(forKey: "thirdDefault")*100))%", forSegmentAt: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //setup default index
        defaultControl.selectedSegmentIndex = defaults.integer(forKey: "defaultIndex")
    }
    
    @IBAction func tip1Slider(_ sender: Any) {
        tip1Label.text = String(format: "%.2f", tipSlider1.value)
        defaults.set(Double(tip1Label.text!), forKey:"firstDefault")
        defaultControl.setTitle("\(String(defaults.double(forKey: "firstDefault")*100))%", forSegmentAt: 0)
    }
    
    @IBAction func tip2Slider(_ sender: Any) {
        tip2Label.text = String(format: "%.2f", tipSlider2.value)
        defaults.set(Double(tip2Label.text!), forKey:"secondDefault")
        defaultControl.setTitle("\(String(defaults.double(forKey: "secondDefault")*100))%", forSegmentAt: 1)
    }
    @IBAction func tip3Slider(_ sender: Any) {
        tip3Label.text = String(format: "%.2f", tipSlider3.value)
        defaults.set(Double(tip3Label.text!), forKey:"thirdDefault")
        defaultControl.setTitle("\(String(defaults.double(forKey: "thirdDefault")*100))%", forSegmentAt: 2)
    }
    
    @IBAction func defaultChooser(_ sender: Any) {
        defaults.set(Int(defaultControl.selectedSegmentIndex), forKey: "defaultIndex")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
