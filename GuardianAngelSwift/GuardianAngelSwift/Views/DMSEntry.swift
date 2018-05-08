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
    @IBOutlet public weak var titleLabel: UILabel! = UILabel()
    @IBOutlet public weak var dateTimeLabel: UILabel! = UILabel()
    @IBOutlet public weak var enabledSwitch: UISwitch! = UISwitch()
}
