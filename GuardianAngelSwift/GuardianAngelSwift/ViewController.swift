//
//  ViewController.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/7/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit

class DeadManSwitch {
    var title: String
    var time: Date
    var enabled: Bool
    var action: Array<DMSAction>
    
    @IBOutlet weak var DMSEntries: DMSEntryListView!
    init(title Title: String, time Time: Date, enabled Enabled: Bool, action Action: Array<DMSAction>)
    {
        title = Title
        time = Time
        enabled = Enabled
        action = Action
    }
    init(title Title: String, time Time: Date, enabled Enabled: Bool)
    {
        title = Title
        time = Time
        enabled = Enabled
        action = []
    }
}

var LoadMessageShown:Bool = false

class DMSAction{
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleEntries()
    }
    
    override func viewDidAppear(_ animated: Bool) { //occurs when the first view appears
        //viewDidAppear(false)
        /* The code below would simply display a message when the program loaded.
        if (!LoadMessageShown)
        {
            LoadMessageShown = true
            OKAlert(title: nil, message: "Program loaded successfully.")

        }
 */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func OKAlert(title: String?, message: String?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func loadSampleEntries() {
        var switches = Array<DeadManSwitch>()
        var switch1:DeadManSwitch = DeadManSwitch(title: "Let the dog out", time: Date(), enabled: true)
        var switch2:DeadManSwitch = DeadManSwitch(title: "Clean the bird cage", time: Date(), enabled: false)
        switches += [switch1, switch2]
        
        
    }
}

