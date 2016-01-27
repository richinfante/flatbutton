//
//  FlatButton.swift
//
//  Created by Richard Infante on 1/22/16.
//  Copyright © 2016 richinfante. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class FlatButton : UIButton {
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    func hover(){
        UIView.animateWithDuration(0.2) {
            self.backgroundColor = self.borderColor?.colorWithAlphaComponent(0.4)
        }
    }
    
    func hoverOut(){
        UIView.animateWithDuration(0.2) {
            self.backgroundColor = UIColor.clearColor()
        }
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addTarget(self, action: "hover", forControlEvents: UIControlEvents.TouchDown)
        self.addTarget(self, action: "hoverOut", forControlEvents: UIControlEvents.TouchDragExit)
        self.addTarget(self, action: "hover", forControlEvents: UIControlEvents.TouchDragEnter)
        self.addTarget(self, action: "hoverOut", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.setTitleColor(self.borderColor, forState: UIControlState.Selected)
        self.setTitleColor(self.borderColor, forState: UIControlState.Normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitleColor(self.borderColor, forState: UIControlState.Selected)
        self.setTitleColor(self.borderColor, forState: UIControlState.Normal)
    }
}
