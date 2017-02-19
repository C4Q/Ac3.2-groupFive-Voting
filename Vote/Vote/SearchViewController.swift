//
//  SearchViewController.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit


class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipTextField: UITextField!
    
    var zip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipTextField.delegate = self
        title = "Find Your Rep"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
//    override func viewDidLayoutSubviews() {
//        let splash = SplashAnimationViewController()
//        self.present(splash, animated: true, completion: nil)
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let numbers = Set<String>(arrayLiteral: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
        guard numbers.contains(string) || string.isEmpty else { return false }
        
        if textField.text!.characters.count + string.characters.count == 5 {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let dvc = storyboard.instantiateViewController(withIdentifier: "rtvc") as! RepresentativeTableViewController
            dvc.getReps(from: textField.text! + string)
            self.navigationController?.pushViewController(dvc, animated: true)
        }
        print(string)
        return true
    }
}
