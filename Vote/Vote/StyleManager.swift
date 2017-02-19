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
        let proxyBarButton = UIBarButtonItem.appearance()
        // details & text
        let proxyImageView = UIImageView.appearance()
        let proxyLabel = UILabel.appearance()
        let proxyTextField = UITextField.appearance()
        let proxyTextView = UITextView.appearance()
        let proxyPlaceholder = UILabel.appearance(whenContainedInInstancesOf: [UITextField.self])
        // generalized info
        let proxyWebView = UIWebView.appearance()
        let proxyTableView = UITableView.appearance()
        let proxyCell = UITableViewCell.appearance()
        let proxyScrollView = UIScrollView.appearance()
        
        // top bar styling
        proxyNavBar.backgroundColor = UIColor.hackathonBlue
        proxyNavBar.tintColor = UIColor.hackathonCream
        
        
        // detail & text styling
        proxyLabel.textColor = UIColor.hackathonBlack
        proxyLabel.font = UIFont(name: semiboldFont, size: 20)
        proxyLabel.textColor = UIColor.hackathonGrey
       
        proxyTextView.font = UIFont(name: regularFont, size: 16)
        proxyTextView.textColor = UIColor.hackathonBlack
        proxyTextField.backgroundColor = UIColor.hackathonRed
        proxyTextField.textColor = UIColor.hackathonGrey
        proxyTextField.font = UIFont(name: semiboldFont, size: 20)
        proxyTextField.layer.cornerRadius = 3.0
        proxyPlaceholder.font = UIFont(name: lightFont, size: 20)
        proxyPlaceholder.backgroundColor = proxyTextField.backgroundColor
        proxyPlaceholder.textColor = proxyTextField.textColor
        proxyTextField.placeholder = "Enter your zipcode"
        
        // generalized info styling
        proxyWebView.scalesPageToFit = true
        proxyWebView.scrollView.bounces = true
        proxyWebView.layer.cornerRadius = 3.0
        proxyWebView.layer.borderWidth = 1.0
        
        proxyTableView.backgroundColor = UIColor.hackathonCream
        proxyTableView.tableHeaderView?.backgroundColor = UIColor.hackathonRed
        proxyTableView.tableHeaderView?.tintColor = UIColor.hackathonCream
        
        proxyScrollView.bounces = true
        proxyScrollView.backgroundColor = UIColor.hackathonCream
        proxyScrollView.tintColor = UIColor.hackathonRed
    }
    
}
