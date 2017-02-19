//
//  SplashAnimationViewController.swift
//  Vote
//
//  Created by Marty Avedon on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class SplashAnimationViewController: UIViewController {
    
    var phoneView: UIImageView?
    var buildingView: UIImageView?
    var blueBubbleViewLeft: UIImageView?
    var blueBubbleViewRight: UIImageView?
    var redBubbleViewLeft: UIImageView?
    var redBubbleViewRight: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.hackathonCream
        
        // MARK: - Animations
        
        // create this stuff & constrain it
        
        self.buildingView = UIImageView(frame: .zero)
        self.phoneView = UIImageView(frame: .zero)
        self.blueBubbleViewRight = UIImageView(frame: .zero)
        self.blueBubbleViewLeft = UIImageView(frame: .zero)
        self.redBubbleViewRight = UIImageView(frame: .zero)
        self.redBubbleViewLeft = UIImageView(frame: .zero)
        
        self.buildingView?.image = #imageLiteral(resourceName: "blueBuilding")
        self.phoneView?.image = #imageLiteral(resourceName: "redPhone")
        self.blueBubbleViewRight?.image = #imageLiteral(resourceName: "blueBubble")
        self.blueBubbleViewLeft?.image = #imageLiteral(resourceName: "blueBubble")
        self.redBubbleViewRight?.image = #imageLiteral(resourceName: "redBubble")
        self.redBubbleViewLeft?.image = #imageLiteral(resourceName: "redBubble")
        
        self.view.addSubview(buildingView!)
        self.view.addSubview(phoneView!)
        self.view.addSubview(blueBubbleViewRight!)
        self.view.addSubview(blueBubbleViewLeft!)
        self.view.addSubview(redBubbleViewRight!)
        self.view.addSubview(redBubbleViewLeft!)
        
        self.view.bringSubview(toFront: buildingView!)
        self.view.bringSubview(toFront: phoneView!)
        self.view.bringSubview(toFront: blueBubbleViewLeft!)
        self.view.bringSubview(toFront: redBubbleViewLeft!)
        self.view.bringSubview(toFront: blueBubbleViewRight!)
        self.view.bringSubview(toFront: redBubbleViewRight!)
        
        self.buildingView?.snp.makeConstraints{ (view) in
            view.centerY.equalToSuperview()
            view.centerX.equalToSuperview()
        }
        
        self.phoneView?.snp.makeConstraints{ (view) in
            view.centerY.equalTo((buildingView?.snp.centerY)!)
            view.centerX.equalTo((buildingView?.snp.centerX)!)
        }
        
        self.blueBubbleViewRight?.snp.makeConstraints{ (view) in
            view.centerY.equalTo((buildingView?.snp.centerY)!)
            view.leading.equalTo((buildingView?.snp.trailing)!).inset(9)
        }
        
        self.blueBubbleViewLeft?.snp.makeConstraints{ (view) in
            view.centerY.equalTo((buildingView?.snp.centerY)!).inset(-15)
            view.trailing.equalTo((buildingView?.snp.leading)!)
        }
        
        self.redBubbleViewRight?.snp.makeConstraints{ (view) in
            view.centerY.equalTo((buildingView?.snp.centerY)!).inset(-25)
            view.leading.equalTo((buildingView?.snp.trailing)!).offset(-10)
        }
        
        self.redBubbleViewLeft?.snp.makeConstraints{ (view) in
            view.centerY.equalTo((buildingView?.snp.centerY)!)
            view.trailing.equalTo((buildingView?.snp.leading)!).offset(9)
        }
        
        redBubbleViewLeft?.transform = CGAffineTransform(scaleX: -1, y: 1)
        blueBubbleViewLeft?.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
