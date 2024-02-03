// 
//  ScanPresenter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit

class ScanPresenter: VTPScanProtocol {
    
    //MARK: - Property ScanPresenter
    var view: PTVScanProtocol?
    var interactor: PTIScanProtocol?
    var router: PTRScanProtocol?
    var viewController : ScanView!

    //MARK: - Lifecycle ScanPresenter
    init() {}
    
    init(viewController: ScanView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function ScanPresenter
    
    func goToScreenSuccess(data: ResultPayEntity, nav: UINavigationController){
        router?.navigateSuccess(data: data, nav: nav)
    }
    func pushBackVC(nav: UINavigationController){
        router?.navigateBackVC(nav: nav)
    }
}

    //MARK: - Extension ScanPresenter
extension  ScanPresenter : ITPScanProtocol {

}
