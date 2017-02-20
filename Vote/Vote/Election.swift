//
//  Election.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class Election  {
    let id: String
    let name: String
    let date: String
    let ocdDivisionID: String
    
    init (id: String, name: String, date: String, ocdDivisionID: String) {
        self.id = id
        self.name = name
        self.date = date
        self.ocdDivisionID = ocdDivisionID
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let id = dict["id"] as? String,
        let name = dict["name"] as? String,
        let date = dict["electionDay"] as? String,
            let ocdDivisionID = dict["ocdDivisionId"] as? String else { return nil }
        self.init(id: id, name: name, date: date, ocdDivisionID: ocdDivisionID)
    }
}
