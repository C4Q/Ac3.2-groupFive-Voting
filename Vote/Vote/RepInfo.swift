//
//  RepInfo.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class RepInfo {
    var offices: [Office]
    var officials: [GovernmentOfficial]
    
    init(offices: [Office], officials: [GovernmentOfficial]) {
        self.offices = offices
        self.officials = officials
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let officesDicts = dict["offices"] as? [[String: AnyObject]],
            let officialsDicts = dict["officials"] as? [[String: AnyObject]] else { return nil }
        var offices = [Office]()
        var officials = [GovernmentOfficial]()
        for officeDict in officesDicts {
            if let office = Office(dict: officeDict) {
                print("office made")
                offices.append(office)
            } else {
                print("office unaccounted for : \(officeDict)")
            }
        }
        
        for officialDict in officialsDicts {
            if let official = GovernmentOfficial(dict: officialDict) {
                print("official made")
                officials.append(official)
            } else {
                dump(officialDict)
            }
        }
        
        self.init(offices: offices, officials: officials)
    }
}

class Office {
    let name: String
    let divisionId: String
    let levels: String?
    let roles: String?
    let indices: [Int]
    
    init(name: String, divisionId: String, levels: String?, roles: String?, indices: [Int]) {
        self.name = name
        self.divisionId = divisionId
        self.levels = levels
        self.roles = roles
        self.indices = indices
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
            let divisionId = dict["divisionId"] as? String,
            let indices = dict["officialIndices"] as? [Int] else { return nil }
        let levels = dict["levels"] as? [String]
        let roles = dict["roles"] as? [String]
        
        self.init(name: name, divisionId: divisionId, levels: levels?.joined(separator: ", "), roles: roles?.joined(separator: ", "), indices: indices)
    }
}

class GovernmentOfficial {
    var name: String
    var party: String
    var address: Address?
    var phone: String?
    var officeURL: String?
    var photoURL: String?
    var channels: [Channel]?
    var email: String?
    
    init(name: String, address: Address?, party: String, phone: String?, officeURL: String?, photoURL: String?, channels: [Channel]?, email: String?) {
        self.name = name
        self.party = party
        self.address = address
        self.phone = phone
        self.officeURL = officeURL
        self.photoURL = photoURL
        self.channels = channels
        self.email = email
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
            let party = dict["party"] as? String else { return nil }
        
        var officeURL: String? = nil
        if let urls = dict["urls"] as? [String] {
            officeURL = urls.first
        }
        
        var address: Address? = nil
        if let addressDicts = dict["address"] as? [[String: String]],
            let addressDict = addressDicts.first {
            address = Address(addressDict)
        }
        
        var phone: String? = nil
        if let phones = dict["phones"] as? [String] {
            phone = phones.first
        }
        
        var channels: [Channel]? = nil
        
        if let channelDicts = dict["channels"] as? [[String: String]] {
            channels = []
            for channelDict in channelDicts {
                if let channel = Channel(channelDict) {
                    print("channel made")
                    channels!.append(channel)
                }
            }
        }
        let photoURL = dict["photoUrl"] as? String
        var email: String? = nil
        if let emails = dict["emails"] as? [String] {
            email = emails.first
        }
        
        
        self.init(name: name, address: address, party: party, phone: phone, officeURL: officeURL, photoURL: photoURL, channels: channels, email: email)
    }
    
}

/*
 {
 "party": "Republican",
 "phones": [
 "(202) 456-1111"
 ],
 "urls": [
 "http://www.whitehouse.gov/"
 ],
 "photoUrl": "https://www.whitehouse.gov/sites/whitehouse.gov/files/images/45/PE%20Color.jpg",
 "channels": [
 {
 "type": "GooglePlus",
 "id": "+whitehouse"
 },
 {
 "type": "Facebook",
 "id": "whitehouse"
 },
 {
 "type": "Twitter",
 "id": "whitehouse"
 },
 {
 "type": "YouTube",
 "id": "whitehouse"
 }
 ]
 },
 */

class Channel {
    let type: String
    let id: String
    
    init(type: String, id: String) {
        self.type = type
        self.id = id
    }
    
    convenience init?(_ dict: [String: String]) {
        guard let type = dict["type"],
            let id = dict["id"] else { return nil }
        self.init(type: type, id: id)
    }
}


