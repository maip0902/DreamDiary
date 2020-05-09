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
    
    func setCorenerRadius(_ uiContents: UIControl) {
        uiContents.layer.cornerRadius = uiContents.frame.size.width * 0.1
    }
    
    func setBorderWidth(_ uiContents: UIControl) {
        uiContents.layer.borderWidth = 2
    }
    
    func setBorderColor(_ uiContents: UIControl) {
        uiContents.layer.borderColor = UIColor.orange.cgColor
    }
}
