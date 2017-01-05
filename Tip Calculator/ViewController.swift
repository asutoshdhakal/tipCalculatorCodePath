//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Asutosh Dhakal on 12/15/16.
//  Copyright © 2016 Asu Dhakal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //NSUserDefaults store things like application settings, the current user, or a flag for whether a user has already seen a helpful hints popover.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let numberOfPeople = [1.0, 2.0, 3.0, 4.0, 5.0]
        let bill = Double(billField.text!) ?? 0
        
        let currTipIndex = tipControl.selectedSegmentIndex
        let currTipPercentage = tipPercentages[currTipIndex]
        
        
        let tip = bill * currTipPercentage
        let total = (bill + tip) / numberOfPeople[peopleControl.selectedSegmentIndex]
        
        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
}

