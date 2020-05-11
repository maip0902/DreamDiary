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
    
    // Top用
    func spaceBetween(_ first: UIControl, _ second: UIControl) {
        first.frame = CGRect(x:screenWidth*0.2, y:screenHeight*0.25 + screenHeight*0.1, width: screenWidth*0.6, height:screenHeight*0.1)
        second.frame = CGRect(x:screenWidth*0.2, y:screenHeight*0.5 + screenHeight*0.1, width: screenWidth*0.6, height:screenHeight*0.1)
    }
    
    // Login用
    func setFormLabel(_ firstLabel: UILabel, _ secondLabel: UILabel) {
        firstLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.2, width: screenWidth*0.3, height:screenHeight*0.05)
        secondLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.4, width: screenWidth*0.3, height:screenHeight*0.05)
    }
    
    // Register用
    func setThreeFormLabel(_ firstLabel: UILabel, _ secondLabel: UILabel, _ thirdLabel: UILabel) {
        firstLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.2, width: screenWidth*0.3, height:screenHeight*0.05)
        secondLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.3, width: screenWidth*0.3, height:screenHeight*0.05)
        thirdLabel.frame = CGRect(x:screenWidth*0.1, y:screenHeight*0.4, width: screenWidth*0.3, height:screenHeight*0.05)
    }
    
    // Login用
    func setInputField(_ firstInput: UIControl, _ secondInput: UIControl) {
        firstInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.2, width: screenWidth*0.5, height:screenHeight*0.05)
        secondInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.4, width: screenWidth*0.5, height:screenHeight*0.05)
    }
    
    // Register用
    func setThreeInputField(_ firstInput: UIControl, _ secondInput: UIControl, _ thirdInput: UIControl) {
        firstInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.2, width: screenWidth*0.5, height:screenHeight*0.05)
        secondInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.3, width: screenWidth*0.5, height:screenHeight*0.05)
        thirdInput.frame = CGRect(x:screenWidth*0.35, y:screenHeight*0.4, width: screenWidth*0.5, height:screenHeight*0.05)
    }
    
    // footer
    func setFooter(_ footerView: UIView) {
        footerView.frame = CGRect(x:0, y:screenHeight*0.9, width:screenWidth, height: screenHeight*0.1)
    }
    
    
    /**
     その他
     丸角・枠線の太さ・widthのセンタリング
     */
    
    func setCorenerRadius(_ uiContent: UIControl, _ ratio: CGFloat) {
        uiContent.layer.cornerRadius = uiContent.frame.size.width * ratio
    }
    
    func setBorderWidth(_ uiContent: UIControl, _ width: CGFloat) {
        uiContent.layer.borderWidth = width
    }
    
    func setBorderColor(_ uiContent: UIControl, _ color: CGColor) {
        uiContent.layer.borderColor = color
    }
    
    func centeringWidth(_ uiContent: UIControl, _ yPosition: CGFloat, _ contetWidth: CGFloat, _ contentHeight: CGFloat) {
        uiContent.frame = CGRect(x:(screenWidth - screenWidth*contetWidth)/2, y:screenHeight*yPosition, width: screenWidth*contetWidth, height:screenHeight*contentHeight)
    }
}
