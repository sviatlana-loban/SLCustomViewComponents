//
//  DesignableButtton.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/1/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

@IBDesignable
public class SLShadowedButton: UIButton {
    @IBInspectable
    public var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity/100
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

}
