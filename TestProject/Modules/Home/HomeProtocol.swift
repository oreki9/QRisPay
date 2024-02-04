// 
//  HomeProtocol.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    
    func getPromoData()
    func goToDetail(image: UIImage, data: PromoEntity, nav: UINavigationController)
}

protocol PTVHomeProtocol: AnyObject {
    func showListPromo(data: HomeEntity)
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    func fetchPromoData()
}

protocol ITPHomeProtocol: AnyObject {
    func setListPromo(data: HomeEntity)
}

protocol PTRHomeProtocol: AnyObject {
    func navigateToDetail(image: UIImage, data: PromoEntity, nav: UINavigationController)
}
