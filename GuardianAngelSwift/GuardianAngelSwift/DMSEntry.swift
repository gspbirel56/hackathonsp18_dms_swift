//
//  DMSEntry.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/8/18.
//  Copyright © 2018 Chris Morris. All rights reserved.
//

import UIKit

class DMSEntry: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var enabledSwitch: UISwitch!
    
    /*
    init(title: String, dateTime: String, enabledSwitch: Bool)
    {
        
        titleLabel.text = title
        dateTimeLabel.text = dateTime
        self.enabledSwitch.isOn = enabledSwitch
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
