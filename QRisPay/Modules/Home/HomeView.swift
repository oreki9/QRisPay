// 
//  HomeView.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class HomeView: UIViewController {
    
    //MARK: - Property HomeView
    @IBOutlet weak var toolbarView: ToolbarView!
    
    @IBOutlet weak var mainBoard: UIViewCustom!
    @IBOutlet weak var scanQR: UIButton!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var seeAllHistoryBtn: UIButton!
    
    
    var presenter: VTPHomeProtocol?

    //MARK: - Lifecycle HomeView
    override func viewDidLoad() {
        setupView()
        setupAction()
        setupData()
    }
    override func viewDidDisappear(_ animated: Bool) {

    }
    
    //MARK: - Function HomeView
    func setupView(){
        toolbarView.setToolbar(title: "Home", isBack: false)
        toolbarView.delegate = self
        amountLbl.text = "Rp \(AppSetting.shared.balance.decimalFormat)"
    }
    func setupAction(){
        scanQR.addTarget(self, action: #selector(scanQRActiom), for: .touchUpInside)
        seeAllHistoryBtn.addTarget(self, action: #selector(seeAllHistoryActiom), for: .touchUpInside)
    }
    func setupData(){ }

    //MARK: - Function Action HomeView
    @objc func scanQRActiom(){
        if let nav = self.navigationController {
            presenter?.goToScanQR(nav: nav)
        }
    }
    @objc func seeAllHistoryActiom(){
        if let nav = self.navigationController {
            presenter?.goToPayHistory(nav: nav)
        }
    }
}

    //MARK: - Extension HomeView

extension HomeView: PTVHomeProtocol {

}
extension HomeView: ToolbarViewDelegate {
    func pressBack() {
        if let nav = self.navigationController {
            presenter?.pushBackVC(nav: nav)
        }
    }
}
