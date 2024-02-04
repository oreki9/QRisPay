// 
//  DetailPresenter.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
import UIKit

class DetailPresenter: VTPDetailProtocol {
    
    //MARK: - Property DetailPresenter
    var view: PTVDetailProtocol?
    var interactor: PTIDetailProtocol?
    var router: PTRDetailProtocol?
    var viewController : DetailView!

    //MARK: - Lifecycle DetailPresenter
    init() {}
    
    init(viewController: DetailView ) {
        self.viewController = viewController
    }
    
    //MARK: - Function DetailPresenter
    func goToBack(nav: UINavigationController){
        router?.navigateToBack(nav: nav)
    }
    
}

    //MARK: - Extension DetailPresenter
extension  DetailPresenter : ITPDetailProtocol {

}
