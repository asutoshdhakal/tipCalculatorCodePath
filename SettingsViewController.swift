//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Asutosh Dhakal on 12/18/16.
//  Copyright © 2016 Asu Dhakal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load the current tip index from the local storage.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    //when change setting, load it to NSUserDefaults as local storage.
    @IBAction func onChangeDefaultTip(sender: AnyObject) {
        let changedDefaultTip = tipControl.selectedSegmentIndex;
        let defaults = UserDefaults.standard
        defaults.set(changedDefaultTip, forKey: "default_tip_index")
        defaults.synchronize()
    }
    
    @IBAction func onClose(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
