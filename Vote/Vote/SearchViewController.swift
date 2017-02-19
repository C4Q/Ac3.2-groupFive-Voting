//
//  SearchViewController.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit

let context = 0


class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipTextField: UITextField!
    
    var time = 0.0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(checkTextFieldContent(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: zipTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.time = 0.0

        
        if !zipTextField.text!.isEmpty {
            zipTextField.text = ""
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        let splash = SplashAnimationViewController()
//        self.present(splash, animated: true, completion: nil)
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numbers = Set<String>(arrayLiteral: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
        guard numbers.contains(string) || string.isEmpty else { return false }
        
        return true
    }
    
    func checkTextFieldContent (_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if textField.text!.characters.count == 5 {
                self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(checkTime), userInfo: nil, repeats: true)
                
                timer.fire()
            }
        }
    }
    
    func checkTime () {
        if self.time == 1  {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let dvc = storyboard.instantiateViewController(withIdentifier: "rtvc") as! RepresentativeTableViewController
            dvc.getReps(from: self.zipTextField.text!)
            self.navigationController?.pushViewController(dvc, animated: true)
            timer.invalidate()
        }
        self.time += 1
    }
}
