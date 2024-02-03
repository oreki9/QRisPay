// 
//  HistoryPresenter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit

class HistoryPresenter: VTPHistoryProtocol {
    
    //MARK: - Property HistoryPresenter
    var view: PTVHistoryProtocol?
    var interactor: PTIHistoryProtocol?
    var router: PTRHistoryProtocol?
    var viewController : HistoryView!

    //MARK: - Lifecycle HistoryPresenter
    init() {}
    
    init(viewController: HistoryView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function HistoryPresenter
    func goToHome(nav: UINavigationController){
        router?.navigateToHome(nav: nav)
    }
    func pushBackVC(nav: UINavigationController){
        router?.navigateBack(nav: nav)
    }
}

    //MARK: - Extension HistoryPresenter
extension  HistoryPresenter : ITPHistoryProtocol {

}
