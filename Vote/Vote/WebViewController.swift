//
//  ArticlesTableViewController.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import WebKit
import AudioToolbox

class WebViewController: UIViewController {
    
    var address: String!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var navTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Articles"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        //load inital request
        let initialURL = URL(string: "http://www.cnn.com")
        if let url = initialURL {
            address = "\(url)"
        let urlRequest = URLRequest(url: url)
            webView.loadRequest(urlRequest)
        }
        navTextField.backgroundColor = UIColor.lightGray
        navTextField.text = address
    }
    
    
    func navigation() {
        
    }
    
    // MARK: - Noise
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController){
            AudioServicesPlaySystemSound(1105)
        }
    }
    
}
