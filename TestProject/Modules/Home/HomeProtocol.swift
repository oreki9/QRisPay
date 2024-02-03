// 
//  HomeProtocol.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    func goToScanQR(nav: UINavigationController)
    func pushBackVC(nav: UINavigationController)
    func goToPayHistory(nav: UINavigationController)
}

protocol PTVHomeProtocol: AnyObject {
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }

}

protocol ITPHomeProtocol: AnyObject {
    
}

protocol PTRHomeProtocol: AnyObject {
    func navigateScanQR(nav: UINavigationController)
    func navigateBackVC(nav: UINavigationController)
    func navigateToPayHistory(nav: UINavigationController)
}
