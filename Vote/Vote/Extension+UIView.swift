//
//  Extension+UIView.swift
//  Vote
//
//  Created by Marty Avedon on 2/20/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

extension UIView {
    func apply(gradient colors: [UIColor]) {
        let layer : CAGradientLayer = CAGradientLayer()
        
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint(x: 0, y: 0)
        
        let cgColors = colors.map { $0.cgColor }
        layer.colors = cgColors
        
        self.layer.insertSublayer(layer, at: 0)
    }
}
