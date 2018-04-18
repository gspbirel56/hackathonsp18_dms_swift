//
//  ViewController.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/7/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var DMSEntries: DMSEntryListView! //our list of switches as represented in the view
    
    var switches: [DMSEntry] = [] //our switches!
    
    
    //below functions are to conform tu UITableView[...] standards
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return switches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //load ONE sample entry -- this one will be a blank when all properties are commented out
        let cell = DMSEntries.dequeueReusableCell(withIdentifier: "DMSEntryCell") as! DMSEntry
        //cell.titleLabel.text = "Sample!"
        //cell.dateTimeLabel.text = "Sample time"
        //cell.enabledSwitch.isOn = true
        //cell.selectionStyle = .none
        return cell
 
    }
    //end standard conforming...ANARCHY!!!!!
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        //lets this view controller behave as a table view delegate & data source
        DMSEntries.delegate = self
        DMSEntries.dataSource = self
        
        super.viewDidLoad()
        //DMSEntries.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewDidAppear(_ animated: Bool) { //occurs when the first view appears
        loadSampleEntries()
    }
/* retired when UITableView[...] implemented
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
        let itemToBeAddedToList: DMSEntry = DMSEntry()
        itemToBeAddedToList.titleLabel.text = "You just added me by method!"
        itemToBeAddedToList.dateTimeLabel.text = "Wow!"
        itemToBeAddedToList.enabledSwitch.isOn = false
        switches.append(itemToBeAddedToList)
        
        DMSEntries.beginUpdates()
        let indexPath = IndexPath(row: switches.count - 1, section: 0)
        DMSEntries.insertRows(at: [indexPath], with: .automatic)
        DMSEntries.endUpdates()
    }
}


