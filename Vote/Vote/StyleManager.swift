//
//  StyleManager.swift
//  Vote
//
//  Created by Marty Avedon on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

extension UIColor {
    
}

class StyleManager {
    static let styler = StyleManager()
    
    private init() {}
    
    func prettify() {
        let boldFont = "GillSans-Bold"
        let semiboldFont = "GillSans-SemiBold"
        let regularFont = "GillSans"
        let italicFont = "GillSans-Italic"
        let lightFont = "GillSans-LightItalic"
        
        // top bar
        let proxyNavBar = UINavigationBar.appearance()
        
        // details & text
        let proxyImageView = UIImageView.appearance()
        let proxyLabel = UILabel.appearance()
        let proxyTextField = UITextField.appearance()
        let proxyTextView = UITextView.appearance()
        let proxyPlaceholder = UILabel.appearance(whenContainedInInstancesOf: [UITextField.self])
        let proxyButtonLabel = UILabel.appearance(whenContainedInInstancesOf: [UIButton.self])
        let proxyButton = UIButton.appearance()
        
        // generalized info
        let proxyWebView = UIWebView.appearance()
        let proxyTableView = UITableView.appearance()
        let proxySectionHeader = UITableViewHeaderFooterView.appearance()
        let proxyCollectionCell = UICollectionViewCell.appearance()
        let proxyCollectionView = UICollectionView.appearance()
        let proxyScrollView = UIScrollView.appearance()
        
        // top bar styling
        proxyNavBar.tintColor = UIColor.hackathonCream
        proxyNavBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.hackathonCream, NSFontAttributeName: UIFont(name: boldFont, size: 21)!]
        proxyNavBar.apply(gradient: [UIColor.hackathonBlue.withAlphaComponent(0.1), UIColor.hackathonBlue])
        
        // detail & text styling
        proxyLabel.font = UIFont(name: semiboldFont, size: 20)
        proxyLabel.textColor = UIColor.hackathonGrey
       
        proxyTextView.font = UIFont(name: regularFont, size: 16)
        proxyTextView.textColor = UIColor.hackathonBlack
        proxyTextView.backgroundColor = .clear
        
        proxyTextField.backgroundColor = UIColor.hackathonRed
        proxyTextField.textColor = UIColor.hackathonGrey
        proxyTextField.font = UIFont(name: semiboldFont, size: 20)
        proxyTextField.layer.cornerRadius = 3.0
        proxyTextField.placeholder = "Enter your zipcode"
        proxyPlaceholder.font = UIFont(name: italicFont, size: 20)
        proxyPlaceholder.textAlignment = .center
        proxyPlaceholder.backgroundColor = proxyTextField.backgroundColor
        proxyPlaceholder.textColor = UIColor.hackathonCream
        
        proxyButtonLabel.font = UIFont(name: boldFont, size: 20)
        proxyButton.titleEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
        
        // generalized info styling
        proxyWebView.scalesPageToFit = true
        proxyWebView.scrollView.bounces = true
        proxyWebView.layer.cornerRadius = 3.0
        proxyWebView.layer.borderWidth = 1.0
        
        proxyTableView.backgroundColor = UIColor.hackathonCream
        proxySectionHeader.tintColor = UIColor.hackathonRed
        
        proxyScrollView.bounces = true
        proxyScrollView.backgroundColor = UIColor.hackathonCream
        proxyScrollView.tintColor = UIColor.hackathonRed
        
        proxyCollectionView.backgroundColor = .clear
    }
    
}
