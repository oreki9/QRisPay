//
//  UIViewCostume.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import Foundation
import UIKit

@IBDesignable
class UIViewCustom: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            if let shadowColorTemp = shadowColor {
                self.addShadowColor(color: shadowColorTemp)
            }
        }
    }
}
