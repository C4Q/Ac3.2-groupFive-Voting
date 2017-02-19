//
//  RepresentativesTableViewCell.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class RepresentativesTableViewCell: UITableViewCell {
    
    var official: GovernmentOfficial! {
        didSet {
            self.nameLabel.text = self.official.name
            print(self.official.party)
            switch self.official.party {
            case _ where self.official.party.contains("Democrat"):
                self.partyIcon.image = #imageLiteral(resourceName: "democrat")
            case "Republican":
                self.partyIcon.image = #imageLiteral(resourceName: "republican")
            default:
                self.partyIcon.image = #imageLiteral(resourceName: "defaultParty")
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - View Hierarchy and Constraints
    
    private func setupViewHierarchy () {
        self.contentView.addSubview(partyIcon)
        self.contentView.addSubview(nameLabel)
    }
    
    private func configureConstraints() {
        partyIcon.snp.makeConstraints { (view) in
            view.top.leading.equalToSuperview().offset(4)
            view.bottom.equalToSuperview().inset(4)
            view.height.width.equalTo(40)
        }
        nameLabel.snp.makeConstraints { (view) in
            view.leading.equalTo(partyIcon.snp.trailing).offset(10)
            view.centerY.equalToSuperview()
            view.trailing.equalToSuperview().inset(4)
        }
        //loadOfficial()
    }

    //MARK: Content Managing
    
    func loadOfficial() {
        self.nameLabel.text = self.official.name
        //print(self.official.photoURL)
    }
    
    //MARK: - Views
    
    var partyIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        view.backgroundColor = UIColor.hackathonWhite
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.hackathonBlue.cgColor
        view.layer.borderWidth = 0.75
        return view
    }()
    
    var nameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
}
