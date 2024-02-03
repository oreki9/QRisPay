// 
//  ResultPayRouter.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class ResultPayRouter: PTRResultPayProtocol {
    
    //MARK: - Property ResultPayRouter
    

    //MARK: - Lifecycle ResultPayRouter
    
    
    //MARK: - Function ResultPayRouter
    static func createResultPayModule(data: ResultPayEntity) -> ResultPayView {
        let view =  ResultPayView()
        view.data = data
        let presenter =  ResultPayPresenter(viewController: view)
        let interactor : PTIResultPayProtocol =  ResultPayInteractor()
        let router : PTRResultPayProtocol =  ResultPayRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    func navigateHistory(nav: UINavigationController){
        let vc = HistoryRouter.createHistoryModule()
        nav.pushViewController(vc, animated: true)
    }
    func navigateHome(nav: UINavigationController){
        let vc = HomeRouter.createHomeModule()
        nav.pushViewController(vc, animated: true)
    }
    func navigateBack(nav: UINavigationController){
        nav.popViewController(animated: true)
    }
}

    //MARK: - Extension ResultPayRouter
