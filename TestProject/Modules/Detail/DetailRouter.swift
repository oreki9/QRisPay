// 
//  DetailRouter.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

class DetailRouter: PTRDetailProtocol {
    
    //MARK: - Property DetailRouter
    

    //MARK: - Lifecycle DetailRouter
    
    
    //MARK: - Function DetailRouter
    static func createDetailModule(image: UIImage, data: PromoEntity) -> DetailView {
        let view =  DetailView()
        view.image = image
        view.detailData = data
        let presenter =  DetailPresenter(viewController: view)
        let interactor : PTIDetailProtocol =  DetailInteractor()
        let router : PTRDetailProtocol =  DetailRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    func navigateToBack(nav: UINavigationController){
        nav.popViewController(animated: true)
    }
}

    //MARK: - Extension DetailRouter
