//
//  DMSEntries.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/15/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit

class DMSEntry: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel! = UILabel()
    @IBOutlet weak var dateTimeLabel: UILabel! = UILabel()
    @IBOutlet weak var enabledSwitch: UISwitch! = UISwitch()
}
