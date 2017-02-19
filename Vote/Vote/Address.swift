//
//  Address.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation


class Address {
    let address: String
    
    init(address: String) {
        self.address = address
    }
    convenience init?(_ addressDict: [String: String]) {
        guard let city = addressDict["city"],
            let state = addressDict["state"],
            let zip = addressDict["zip"] else { return nil }
        
        var lineOneString = ""
        if let locationName = addressDict["locationName"] {
            lineOneString += "\(locationName) "
        }
        if let line1 = addressDict["line1"] {
            lineOneString += line1
        }
        if let line2 = addressDict["line2"] {
            lineOneString += " \(line2)"
        }
        if let line3 = addressDict["line3"] {
            lineOneString += " \(line3)"
        }
        
        let address = "\(lineOneString), \(city), \(state) \(zip)"
        self.init(address: address)
    }
    
}
