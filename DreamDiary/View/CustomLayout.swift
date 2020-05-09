//
//  CustomLayout.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/09.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
import UIKit

struct CustomLayout {
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    init(_ screenWidth: CGFloat, _ screenHeight: CGFloat) {
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
    }
    
    func spaceBetween(_ first: UIControl, _ second: UIControl) {
        first.frame = CGRect(x:screenWidth*0.2, y:screenHeight*0.25, width: screenWidth*0.6, height:screenHeight*0.1)
        second.frame = CGRect(x:screenWidth*0.2, y:screenHeight*0.5, width: screenWidth*0.6, height:screenHeight*0.1)
    }
    
    func setCorenerRadius(_ uiContent: UIControl) {
        uiContent.layer.cornerRadius = uiContent.frame.size.width * 0.1
    }
    
    func setBorderWidth(_ uiContent: UIControl) {
        uiContent.layer.borderWidth = 2
    }
    
    func setBorderColor(_ uiContent: UIControl) {
        uiContent.layer.borderColor = UIColor.orange.cgColor
    }
    
    func setFormLabel(_ firstLabel: UILabel, _ secondLabel: UILabel) {
        firstLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.2, width: screenWidth*0.3, height:screenHeight*0.05)
        secondLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.4, width: screenWidth*0.3, height:screenHeight*0.05)
    }
    
    func setInputField(_ firstInput: UIControl, _ secondInput: UIControl) {
        firstInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.2, width: screenWidth*0.5, height:screenHeight*0.05)
        secondInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.4, width: screenWidth*0.5, height:screenHeight*0.05)
    }
    
    func centeringWidth(_ uiContent: UIControl, _ yPosition: CGFloat, _ contetWidth: CGFloat, _ contentHeight: CGFloat) {
        uiContent.frame = CGRect(x:(screenWidth - contetWidth)/2, y:yPosition, width: contetWidth, height:contentHeight)
    }
}
