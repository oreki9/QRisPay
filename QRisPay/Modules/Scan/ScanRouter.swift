// 
//  ScanRouter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class ScanRouter: PTRScanProtocol {
    
    //MARK: - Property ScanRouter
    

    //MARK: - Lifecycle ScanRouter
    
    
    //MARK: - Function ScanRouter
    static func createScanModule() -> ScanView {
        let view =  ScanView()
        let presenter =  ScanPresenter(viewController: view)
        let interactor : PTIScanProtocol =  ScanInteractor()
        let router : PTRScanProtocol =  ScanRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    func navigateSuccess(data: ResultPayEntity, nav: UINavigationController){
        let vc = ResultPayRouter.createResultPayModule(data: data)
        nav.pushViewController(vc, animated: true)
    }
    func navigateBackVC(nav: UINavigationController){
        nav.popViewController(animated: true)
    }
}

    //MARK: - Extension ScanRouter
