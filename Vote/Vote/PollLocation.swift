//
//  PollLocation.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation


class PollLocation {
    var address: Address
    var notes: String
    var hours: String
    
    init(address: Address, notes: String, hours: String) {
        self.address = address
        self.notes = notes
        self.hours = hours
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let addressDict = dict["address"] as? [String: String],
            let address = Address(addressDict),
            let notes = dict["notes"] as? String,
            let hours = dict["hours"] as? String else { return nil }
        
        
        self.init(address: address, notes: notes, hours: hours)
    }
}
