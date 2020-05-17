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
    
    func setPositionByRatio(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat, uiContent: UIControl) {
        uiContent.frame = CGRect(x:screenWidth*x, y:screenHeight*y, width: screenWidth*width, height:screenHeight*height)
    }
    
    func setLabelPositionByRatio(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat, uiContent: UILabel) {
        uiContent.frame = CGRect(x:screenWidth*x, y:screenHeight*y, width: screenWidth*width, height:screenHeight*height)
    }
    
    // width
    func spaceBetweenWidth(uiContents: [UIControl], space: CGFloat, _ y: CGFloat, _ xStart: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        let xStep = screenWidth*space
        for (index, uiContent) in uiContents.enumerated() {
            uiContent.frame = CGRect(x: screenHeight*xStart + CGFloat(index)*xStep, y: screenHeight*y, width: self.screenWidth*width, height: self.screenHeight*height)
        }
    }
    
    // width label
    func spaceBetweenWidthLabel(uiContents: [UILabel], space: CGFloat, _ y: CGFloat, _ xStart: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        let xStep = screenWidth*space
        for (index, uiContent) in uiContents.enumerated() {
            uiContent.frame = CGRect(x: screenHeight*xStart + CGFloat(index)*xStep, y: screenHeight*y, width: self.screenWidth*width, height: self.screenHeight*height)
        }
    }
    
    // height
    func spaceBetweenHeight(uiContents: [UIControl], space: CGFloat, _ x: CGFloat, _ yStart: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        let yStep = screenWidth*space
        for (index, uiContent) in uiContents.enumerated() {
            uiContent.frame = CGRect(x: self.screenWidth*x, y: screenHeight*yStart + CGFloat(index)*yStep, width: self.screenWidth*width, height: self.screenHeight*height)
        }
    }
    
    // height label
    func spaceBetweenHeightLabel(uiContents: [UILabel], space: CGFloat, _ x: CGFloat, _ yStart: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        let yStep = screenWidth*space
        for (index, uiContent) in uiContents.enumerated() {
            uiContent.frame = CGRect(x: self.screenWidth*x, y: screenHeight*yStart + CGFloat(index)*yStep, width: self.screenWidth*width, height: self.screenHeight*height)
        }
    }
    
    // footer
    func setFooter(_ footerView: UIView) {
        footerView.frame = CGRect(x:0, y:screenHeight*0.9, width:screenWidth, height: screenHeight*0.1)
    }
    
    
    /**
     その他
     丸角・枠線の太さ・widthのセンタリング
     */
    
    func setOutlet(_ uiContent: UIControl, radius: CGFloat, borderWidth: CGFloat, color: CGColor) {
        uiContent.layer.cornerRadius = uiContent.frame.size.width * radius
        uiContent.layer.borderWidth = borderWidth
        uiContent.layer.borderColor = color
    }
    
    func setLabel(_ uiContent: UILabel, radius: CGFloat, borderWidth: CGFloat, color: CGColor) {
        uiContent.layer.cornerRadius = uiContent.frame.size.width * radius
        uiContent.layer.borderWidth = borderWidth
        uiContent.layer.borderColor = color
    }
    
    func centeringWidth(_ uiContent: UIControl, _ yPosition: CGFloat, _ contetWidth: CGFloat, _ contentHeight: CGFloat) {
        uiContent.frame = CGRect(x:(screenWidth - screenWidth*contetWidth)/2, y:screenHeight*yPosition, width: screenWidth*contetWidth, height:screenHeight*contentHeight)
    }
}
