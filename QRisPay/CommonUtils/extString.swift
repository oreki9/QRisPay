//
//  extString.swift
//  QRisPay
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
extension Array where Element == String {
    func safeGet(index: Int) -> String {
        if(index<0 || index>=self.count){ return "" }
        return self[index]
    }
}
extension String {
    func ToDouble() -> Double {
        return Double(self) ?? 0
    }
}
