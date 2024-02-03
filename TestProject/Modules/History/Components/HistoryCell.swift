//
//  HistoryCell.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
import UIKit
class HistoryCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    static let identifier = "HistoryCellIdentifier"

    static func nib() -> UINib {
        return UINib(nibName: "HistoryCell", bundle: nil)
    }
    func setView(data: ResultPayEntity){
        self.titleLbl.text = "\(data.bankReceiver) - \(data.nameReceiver)"
        self.amountLbl.text = "Rp \(data.amountPaid.decimalFormat)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
