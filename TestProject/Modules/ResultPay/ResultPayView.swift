// 
//  ResultPayView.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class ResultPayView: UIViewController {
    
    //MARK: - Property ResultPayView
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var amountDescLbl: UILabel!
    @IBOutlet weak var toHistoryBtn: UIButton!
    @IBOutlet weak var toHomeBtn: UIButton!
    @IBOutlet weak var balanceDescLbl: UILabel!
    
    @IBOutlet weak var nameVal: UILabel!
    @IBOutlet weak var bankNameVal: UILabel!
    var presenter: VTPResultPayProtocol?
    var data : ResultPayEntity?
    //MARK: - Lifecycle ResultPayView
    override func viewDidLoad() {
        setupView()
        setupAction()
        setupData()
    }
}
extension ResultPayView {
    //MARK: - Function ResultPayView
    func setupView(){
        toolbar.setToolbar(title: "Success Payment", isBack: false)
        toolbar.delegate = self
        amountDescLbl.text = "Your Payment of \(data!.idTrans) - Rp \(data!.amountPaid.decimalFormat) is Successfully"
        balanceDescLbl.text = "Your Balance is Rp. \(AppSetting.shared.balance.decimalFormat)"
        nameVal.text = data?.nameReceiver
        bankNameVal.text = data?.bankReceiver
    }
    func setupAction(){
        toHistoryBtn.addTarget(self, action: #selector(toToHistoryAction), for: .touchUpInside)
        toHomeBtn.addTarget(self, action: #selector(toBackHomeAction), for: .touchUpInside)
    }
    func setupData(){
    }
    //MARK: - Function Action ResultPayView
    @objc func toToHistoryAction(){
        if let nav = self.navigationController {
            presenter?.goToHistory(nav: nav)
        }
    }
    @objc func toBackHomeAction(){
        if let nav = self.navigationController {
            presenter?.goToHome(nav: nav)
        }
    }
}
extension ResultPayView : ToolbarViewDelegate {
    func pressBack() {
        if let nav = self.navigationController {
            presenter?.pushBackVC(nav: nav)
        }
    }
}

    //MARK: - Extension ResultPayView

extension ResultPayView: PTVResultPayProtocol {

}
