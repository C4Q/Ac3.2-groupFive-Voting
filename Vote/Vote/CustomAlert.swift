//
//  CustomAlert.swift
//  Graffy
//
//  Created by Marty Avedon on 2/7/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import JSSAlertView

func showAlert(_ message: String, presentOn: UIViewController) {
    let alertview = JSSAlertView().show(presentOn,
                                        title: message,
                                        buttonText: "Ok",
                                        color: UIColor.hackathonBlue
    )
    
    alertview.setTitleFont("GillSans-SemiBold")
    alertview.setTextTheme(.light) // can be .light or .dark
    alertview.setButtonFont("GillSans-Regular")
}
