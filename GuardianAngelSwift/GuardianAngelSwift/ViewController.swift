//
//  ViewController.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/7/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit

class DeadManSwitch {
    public var title: String
    public var time: String
    public var enabled: Bool
    public var action: Array<DMSAction>
    
    
    init(title Title: String, time Time: String, enabled Enabled: Bool, action Action: Array<DMSAction>)
    {
        title = Title
        time = Time
        enabled = Enabled
        action = Action
    }
    init(title Title: String, time Time: String, enabled Enabled: Bool)
    {
        title = Title
        time = Time
        enabled = Enabled
        action = []
    }
}



class DMSAction{
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var DMSEntries: DMSEntryListView!
    //below functions are to conform tu UITableView[...] standards
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //0 rows in section to start.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //load a sample entry
        
        let cell = DMSEntries.dequeueReusableCell(withIdentifier: "DMSEntryCell") as! DMSEntry
        cell.titleLabel.text = "Sample!"
        cell.dateTimeLabel.text = "Sample time"
        cell.enabledSwitch.isOn = true
        cell.selectionStyle = .none
        return cell
    }
    

    
    
var LoadMessageShown:Bool = false
    
    
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        //lets this view controller behave as a table view delegate & data source
        DMSEntries.delegate = self
        DMSEntries.dataSource = self
        
        //loadSampleEntries()
        super.viewDidLoad()
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
/* deleted when UITableView[...] implemented
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    
    func OKAlert(title: String?, message: String?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func loadSampleEntries() {
        //declare the arrays
        var switches = Array<DeadManSwitch>()
        var switchcells = Array<DMSEntry>()
        //create switch objects
        var switch1:DeadManSwitch = DeadManSwitch(title: "Let the dog out", time: "now", enabled: true)
        var switch2:DeadManSwitch = DeadManSwitch(title: "Clean the bird cage", time: "now", enabled: true)
        switches += [switch1, switch2]
        //add switch objects into usable DMSEntry objects, then -> DMSEntries [view]
        //switchcells.append(DMSEntry.init(dms: switch1))
        //switchcells.append(DMSEntry.init(dms: switch2))
        
        
    }
}

class DMSEntry: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var enabledSwitch: UISwitch!
    
    convenience init()
    {
        //let aDecoder: NSCoder = NSCoder()
        self.init(coder: NSCoder())!
        self.titleLabel.text = "blank"
        self.dateTimeLabel.text = "blank"
        self.enabledSwitch.isOn = false
    }
    
    convenience init(title: String, dateTime: String, enabledSwitch: Bool)
    {
        self.init()
        titleLabel.text = title
        dateTimeLabel.text = dateTime
        self.enabledSwitch.isOn = enabledSwitch
        
    }
 
    convenience init(dms: DeadManSwitch)
    {
        self.init(title: dms.title, dateTime: dms.time, enabledSwitch: dms.enabled)
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}
