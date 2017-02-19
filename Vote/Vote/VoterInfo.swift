//
//  VoterInfo.swift
//  Vote
//
//  Created by C4Q on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//
import Foundation

class VoterInfo {
    let election: Election
    let locations: [PollLocation]
    let stateID: String
    let stateBody: StateVoteAdminBody
    let localName: String
    let localJurisdiction: LocalVoteAdminBody
    
    init(election: Election, locations: [PollLocation], stateID: String, stateBody: StateVoteAdminBody, localName: String, localJurisdiction: LocalVoteAdminBody) {
        self.election = election
        self.locations = locations
        self.stateID = stateID
        self.stateBody = stateBody
        self.localName = localName
        self.localJurisdiction = localJurisdiction
    }
    
    convenience init?(dict: [String: AnyObject]) {
        guard let electionDict = dict["election"] as? [String: AnyObject],
            let election = Election(dict: electionDict),
            let locationsDicts = dict["pollingLocations"] as? [[String: AnyObject]],
            let stateDictArr = dict["state"] as? [AnyObject],
            let stateDict = stateDictArr[0] as? [String: AnyObject],
            let stateID = stateDict["name"] as? String,
            let stateVoteBodyDict = stateDict["electionAdministrationBody"] as? [String: AnyObject],
            let stateBody = StateVoteAdminBody(dict: stateVoteBodyDict),
            let localDict = stateDict["local_jurisdiction"] as? [String: AnyObject],
            let localName = localDict["name"] as? String,
            let localVoteBodyDict = localDict["electionAdministrationBody"] as? [String: AnyObject],
            let localJurisdiction = LocalVoteAdminBody(dict: localVoteBodyDict) else { return nil }
        var locations = [PollLocation]()
        for locationDict in locationsDicts {
            if let location = PollLocation(dict: locationDict) {
                print("made location")
                locations.append(location)
            }
        }
        self.init(election: election, locations: locations, stateID: stateID, stateBody: stateBody, localName: localName, localJurisdiction: localJurisdiction)
    }
}
