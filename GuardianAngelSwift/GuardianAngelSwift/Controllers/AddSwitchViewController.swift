//
//  AddSwitchViewController.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/24/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit

class AddSwitchViewController: UIViewController {
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var deadline: UIDatePicker!
    @IBOutlet weak var enabled: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewSwitchToArray(_ sender: Any) {
        let addThis = DeadManSwitch(title: titleText.text!, time:"implement this", enabled: enabled.isOn)
        let vc = ViewController()
        vc.addSwitch(add: addThis)
        vc.show(self, sender: Any?.self)
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
