//
//  DeadManSwitch.swift
//  GuardianAngelSwift
//
//  Created by Chris Shula on 4/15/18.
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
