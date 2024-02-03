//
//  extDouble.swift
//  QRisPay
//
//  Created by rickyTA on 03/02/24.
//

import Foundation

extension Double {
    var decimalFormat : String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self))!
    }
}