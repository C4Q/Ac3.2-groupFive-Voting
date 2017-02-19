//
//  HeadlinesCollectionViewCell.swift
//  Vote
//
//  Created by Simone on 2/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class HeadlinesCollectionViewCell: UICollectionViewCell {
    
    var headlines: Article! {
        didSet {
            updateCollectionView()
        }
    }
    
    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    private func updateCollectionView() {
        headlineLabel.text = headlines.headline
    }
}
