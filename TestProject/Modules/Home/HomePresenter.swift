// 
//  HomePresenter.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
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
    func getPromoData(){
        interactor?.fetchPromoData()
    }
    func goToDetail(image: UIImage, data: PromoEntity, nav: UINavigationController){
        router?.navigateToDetail(image: image, data: data, nav: nav)
    }
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func setListPromo(data: HomeEntity){
        view?.showListPromo(data: data)
    }
}
