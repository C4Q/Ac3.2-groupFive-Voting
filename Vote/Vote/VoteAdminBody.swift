//
//  VoteAdminBody.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class StateVoteAdminBody {
    let name: String
    let infoURL: String
    let address: Address
    let registrationURL: String?
    let absenteeVotingInfo: String?
    let locationURL: String?
    let rulesURL: String?
    let ballotInfo: String?
    
    init (name: String, infoURL: String, address: Address, registrationURL: String?, absenteeVotingInfo: String?, locationURL: String?, rulesURL: String?, ballotInfo: String?) {
        self.name = name
        self.infoURL = infoURL
        self.address = address
        self.registrationURL = registrationURL
        self.absenteeVotingInfo = absenteeVotingInfo
        self.locationURL = locationURL
        self.rulesURL = rulesURL
        self.ballotInfo = ballotInfo
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
            let infoURL = dict["electionInfoUrl"] as? String,
            let addressDict = dict["physicalAddress"] as? [String: String],
            let address = Address(addressDict) else { return nil }
        
        
        var registrationURL: String? = nil
        var absenteeVotingInfo: String? = nil
        var locationURL: String? = nil
        var rulesURL: String? = nil
        var ballotInfo: String? = nil
        
        if let validRegistrationURL = dict["electionRegistrationUrl"] as? String {
            registrationURL = validRegistrationURL
        }
        if let validAbsenteeVotingInfo = dict["absenteeVotingInfoUrl"] as? String {
            absenteeVotingInfo = validAbsenteeVotingInfo
        }
        if let validLocationURL = dict["votingLocationFinderUrl"] as? String {
            locationURL = validLocationURL
        }
        if let validRulesURL = dict["electionRulesUrl"] as? String {
            rulesURL = validRulesURL
        }
        if let validBallotInfo = dict["ballotInfoUrl"] as? String {
            ballotInfo = validBallotInfo
        }
        self.init(name: name, infoURL: infoURL, address: address, registrationURL: registrationURL, absenteeVotingInfo: absenteeVotingInfo, locationURL: locationURL, rulesURL: rulesURL, ballotInfo: ballotInfo)
    }
}

class LocalVoteAdminBody {
    let name: String
    let infoURL: String
    let address: Address
    let electionOfficials: [ElectionOfficial]
    
    init(name: String, infoURL: String, address: Address, electionOfficials: [ElectionOfficial]) {
        self.name = name
        self.infoURL = infoURL
        self.address = address
        self.electionOfficials = electionOfficials
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String else { print("name")
            return nil }
        guard let infoURL = dict["electionInfoUrl"] as? String else { print("infoURL")
            return nil }
        guard let addressDict = dict["physicalAddress"] as? [String: String] else { print("addressDict")
            return nil }
        guard let address = Address(addressDict) else { print("address")
            return nil }
        guard let electionOfficialsDicts = dict["electionOfficials"] as? [[String: AnyObject]] else { print("electionsDict")
            return nil }
        var electionOfficials = [ElectionOfficial]()
        for officialDict in electionOfficialsDicts {
            if let official = ElectionOfficial(officialDict) {
                print("official made")
                electionOfficials.append(official)
            }
        }
        self.init(name: name, infoURL: infoURL, address: address, electionOfficials: electionOfficials)
    }
}

class ElectionOfficial {
    let name: String
    let title: String
    let phoneNumber: String
    let faxNumber: String
    let email: String
    
    init (name: String, title: String, phoneNumber: String, faxNumber: String, email: String) {
        self.name = name
        self.title = title
        self.phoneNumber = phoneNumber
        self.faxNumber = faxNumber
        self.email = email
    }
    
    
    convenience init?(_ dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
            let title = dict["title"] as? String,
            let phoneNumber = dict["officePhoneNumber"] as? String,
            let faxNumber = dict["faxNumber"] as? String,
            let email = dict["email"] as? String else { return nil }
        self.init(name: name, title: title, phoneNumber: phoneNumber, faxNumber: faxNumber, email: email)
    }
}
