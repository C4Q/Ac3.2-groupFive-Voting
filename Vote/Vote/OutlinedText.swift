//
//  OutlinedText.swift
//  AC3.2-MidtermElements
//
//  Created by Marty Avedon on 12/10/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//
import UIKit

// from http://stackoverflow.com/questions/1103148/how-do-i-make-uilabel-display-outlined-text

class UIOutlinedLabel: UILabel {
    var outlineWidth: CGFloat = 5
    var outlineColor: UIColor = UIColor.hackathonBlue.withAlphaComponent(0.5)
    
    override func drawText(in rect: CGRect) {
        
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : outlineColor,
            NSStrokeWidthAttributeName : -1 * outlineWidth, // making this negative gives a border around filled text; postive gives outlined text with a transparent fill
            ] as [String : Any]
        
        self.attributedText = NSAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        super.drawText(in: rect)
    }
}
