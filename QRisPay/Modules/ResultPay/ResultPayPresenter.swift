// 
//  ResultPayPresenter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit

class ResultPayPresenter: VTPResultPayProtocol {
    
    //MARK: - Property ResultPayPresenter
    var view: PTVResultPayProtocol?
    var interactor: PTIResultPayProtocol?
    var router: PTRResultPayProtocol?
    var viewController : ResultPayView!

    //MARK: - Lifecycle ResultPayPresenter
    init() {}
    
    init(viewController: ResultPayView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function ResultPayPresenter
    func goToHistory(nav: UINavigationController){
        router?.navigateHistory(nav: nav)
    }
    func goToHome(nav: UINavigationController){
        router?.navigateHome(nav: nav)
    }
    func pushBackVC(nav: UINavigationController){
        router?.navigateBack(nav: nav)
    }
    
}

    //MARK: - Extension ResultPayPresenter
extension  ResultPayPresenter : ITPResultPayProtocol {

}
