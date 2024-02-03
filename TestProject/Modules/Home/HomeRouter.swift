// 
//  HomeRouter.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class HomeRouter: PTRHomeProtocol {
    
    //MARK: - Property HomeRouter
    

    //MARK: - Lifecycle HomeRouter
    
    
    //MARK: - Function HomeRouter
    static func createHomeModule() -> HomeView {
        let view =  HomeView()
        let presenter =  HomePresenter(viewController: view)
        let interactor : PTIHomeProtocol =  HomeInteractor()
        let router : PTRHomeProtocol =  HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    func navigateScanQR(nav: UINavigationController){
        let vc = ScanRouter.createScanModule()
        nav.pushViewController(vc, animated: true)
    }
    func navigateBackVC(nav: UINavigationController) {
        nav.popViewController(animated: true)
    }
    func navigateToPayHistory(nav: UINavigationController) {
        let vc = HistoryRouter.createHistoryModule()
        nav.pushViewController(vc, animated: true)
    }
}