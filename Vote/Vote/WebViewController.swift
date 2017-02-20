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

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var article: Article? {
        didSet {
            loadArticles()
        }
    }
    
    var address: String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        loadArticles()
        title = "Articles"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func loadArticles() {
        
        let initialURL = URL(string: address)
        if let url = initialURL {
            let urlRequest = URLRequest(url: url)
            
            webView.loadRequest(urlRequest)
        }
        
    }
    
    // MARK: - Noise
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController){
            AudioServicesPlaySystemSound(1105)
        }
    }
    
}
