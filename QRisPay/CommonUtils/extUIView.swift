//
//  extUIView.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit
extension UIView {
    func addShadowColor(color: UIColor?, _ width:CGFloat=3.0, height:CGFloat=4.0, Opacidade:Float=0.25, maskToBounds:Bool=false, radius:CGFloat=6){
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
}
