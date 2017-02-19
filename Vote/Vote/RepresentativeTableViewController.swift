//
//  RepresentativeTableViewController.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import AudioToolbox

class RepresentativeTableViewController: UITableViewController {
    
    let cellID = "repCell"
    var representatives = [RepInfo]()
    var office = [Office]()
    var repDetails = [GovernmentOfficial]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of Reps"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target:nil, action:nil)
        self.edgesForExtendedLayout = .bottom
        self.tableView.register(RepresentativesTableViewCell.self, forCellReuseIdentifier: cellID)
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.preservesSuperviewLayoutMargins = false
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
    }

    func getReps(from zip: String) {
        APIRequestManager.manager.getRepInfo(endPoint: "https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyBU0xkqxzxgDJfcSabEFYMXD9M-i8ugdGo&address=\(zip)") { (info) in
            if let validInfo = info {
                dump(validInfo.offices.count)
                dump(validInfo.officials.count)
                self.office = validInfo.offices.reversed()
                self.repDetails = validInfo.officials
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                //Display Alert
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return office.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return office[section].indices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RepresentativesTableViewCell
        let officialIndex = office[indexPath.section].indices[indexPath.row]
        print(officialIndex)
        print()
        let official = self.repDetails[officialIndex]

        cell.official = official
        
        cell.backgroundColor = UIColor.hackathonCream
        cell.nameLabel.font = UIFont(name: "GillSans-SemiBold", size: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return office[section].name
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let currentCell = tableView.cellForRow(at: indexPath) as! RepresentativesTableViewCell
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "rdvc") as! RepDetailsViewController
        dvc.official = currentCell.official
        dvc.office = self.office[indexPath.section]
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.hackathonCream
        header.textLabel?.lineBreakMode = .byWordWrapping
        header.textLabel?.numberOfLines = 2
        header.textLabel?.textAlignment = .center
        header.textLabel?.adjustsFontForContentSizeCategory = true
    }
    
    // MARK: - Noise
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController){
            AudioServicesPlaySystemSound(1105)
        }
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        AudioServicesPlaySystemSound(1105)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
    
