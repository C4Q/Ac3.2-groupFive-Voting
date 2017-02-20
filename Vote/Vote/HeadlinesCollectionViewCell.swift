//
//  HeadlinesCollectionViewCell.swift
//  Vote
//
//  Created by Simone on 2/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class HeadlinesCollectionViewCell: UICollectionViewCell {
    
    var article: Article! {
        didSet {
            inputArticle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func inputArticle() {
        self.articleHeadlineLabel.text = self.article.headline
        self.articleHeadlineLabel.alpha = 0.7
        self.articleHeadlineLabel.font = UIFont(name: "GillSans-SemiBold", size: 16)
        self.articleHeadlineLabel.backgroundColor = UIColor.hackathonBlack
        self.articleHeadlineLabel.textColor = UIColor.hackathonCream
        self.articleImageView.contentMode = .scaleAspectFit
        if let url = self.article.thumbURL {
        APIRequestManager.manager.getImage(APIEndpoint: "https://static01.nyt.com/\(url)") {(data) in
            if let validData = data {
                DispatchQueue.main.async {
                    self.articleImageView.image = UIImage(data: validData)
                }
            }
        }
        }
        //self.articleImageView.image
    }
    
    //MARK: - View Hierarchy and Constraints
    
    func setupViewHierarchy () {
        self.contentView.addSubview(articleImageView)
        self.contentView.addSubview(articleHeadlineLabel)
    }
    
    func configureConstraints () {
        articleImageView.snp.makeConstraints { (view) in
            view.trailing.leading.top.bottom.equalToSuperview()
        }
        
        articleHeadlineLabel.snp.makeConstraints { (view) in
            view.leading.trailing.equalToSuperview()
            view.centerY.equalToSuperview()
        }
    }
    
    //Views
    
    var articleImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    var articleHeadlineLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping
        return view
    }()
}
