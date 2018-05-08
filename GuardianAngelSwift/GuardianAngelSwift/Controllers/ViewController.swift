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
    
    static var switches: [DeadManSwitch] = [] //our switches!
    static var samplesLoadedAlready = false
    
    
    //below functions are to conform tu UITableView[...] standards
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.switches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //load all the sample entries in the array
        let cell = DMSEntries.dequeueReusableCell(withIdentifier: "DMSEntryCell") as! DMSEntry
        
        cell.titleLabel.text = ViewController.switches[indexPath.item].title
        cell.dateTimeLabel.text = ViewController.switches[indexPath.item].time
        cell.enabledSwitch.isOn = ViewController.switches[indexPath.item].enabled
        cell.selectionStyle = .none
        return cell
 
    }
    //end standard conforming...ANARCHY!!!!!
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        //lets this view controller behave as a table view delegate & data source
        DMSEntries?.delegate = self
        DMSEntries?.dataSource = self
        
        super.viewDidLoad()
        //DMSEntries.tableFooterView = UIView(frame: CGRect.zero)
        loadSampleEntries()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DMSEntries.reloadData()
    }
    
    func OKAlert(title: String?, message: String?) //this is nice becuase it lets us add an alert if necessary
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("What?", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func loadSampleEntries() {
        if ViewController.samplesLoadedAlready == false
        {
            ViewController.samplesLoadedAlready = true
            var s = DeadManSwitch(title: "Sample 1", time: "now", enabled: false)
            ViewController.switches.append(s)
            s = DeadManSwitch(title: "You're doing it!", time: "wow!!!", enabled: true)
            ViewController.switches.append(s)
            
        }
    }
    
    public func addSwitch(add: DeadManSwitch)
    {
        ViewController.switches.append(add)
        //update the table data
        //DMSEntries.insertRows(at: [IndexPath(row: switches.count-1, section: 0)], with: .automatic)
        /*
         DMSEntries.beginUpdates()
        DMSEntries.insertRows(at: [IndexPath(row: switches.count - 1, section: 0)], with: .automatic)
        DMSEntries.endUpdates()
        */
        //end add update
        for i in 0..<ViewController.switches.count //debug output
        {
            NSLog(ViewController.switches[i].title)
        }
    }
}

//code below will handle dismissing keyboard when tapped anywhere on view: can be used on any view whatsoever
// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


