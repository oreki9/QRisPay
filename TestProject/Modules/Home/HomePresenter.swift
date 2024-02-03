// 
//  HomePresenter.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {
    
    //MARK: - Property HomePresenter
    var view: PTVHomeProtocol?
    var interactor: PTIHomeProtocol?
    var router: PTRHomeProtocol?
    var viewController : HomeView!

    //MARK: - Lifecycle HomePresenter
    init() {}
    
    init(viewController: HomeView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function HomePresenter
    func goToScanQR(nav: UINavigationController){
        router?.navigateScanQR(nav: nav)
    }
    func pushBackVC(nav: UINavigationController) {
        router?.navigateBackVC(nav: nav)
    }
    func goToPayHistory(nav: UINavigationController) {
        router?.navigateToPayHistory(nav: nav)
    }
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {

}
