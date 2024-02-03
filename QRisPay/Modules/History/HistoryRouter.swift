// 
//  HistoryRouter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class HistoryRouter: PTRHistoryProtocol {
    
    //MARK: - Property HistoryRouter
    

    //MARK: - Lifecycle HistoryRouter
    
    
    //MARK: - Function HistoryRouter
    static func createHistoryModule() -> HistoryView {
        let view =  HistoryView()
        let presenter =  HistoryPresenter(viewController: view)
        let interactor : PTIHistoryProtocol =  HistoryInteractor()
        let router : PTRHistoryProtocol =  HistoryRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    func navigateToHome(nav: UINavigationController){
        let vc = HomeRouter.createHomeModule()
        nav.pushViewController(vc, animated: true)
    }
    func navigateBack(nav: UINavigationController){
        nav.popViewController(animated: true)
    }
}

    //MARK: - Extension HistoryRouter
