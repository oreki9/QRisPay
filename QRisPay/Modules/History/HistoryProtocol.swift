// 
//  HistoryProtocol.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

protocol VTPHistoryProtocol: AnyObject {
    var view: PTVHistoryProtocol? { get set }
    var interactor: PTIHistoryProtocol? { get set }
    var router: PTRHistoryProtocol? { get set }
    func goToHome(nav: UINavigationController)
    func pushBackVC(nav: UINavigationController)
}

protocol PTVHistoryProtocol: AnyObject {
    
}

protocol PTIHistoryProtocol: AnyObject {
    var presenter: ITPHistoryProtocol? { get set }

}

protocol ITPHistoryProtocol: AnyObject {
    
}

protocol PTRHistoryProtocol: AnyObject {
    func navigateToHome(nav: UINavigationController)
    func navigateBack(nav: UINavigationController)
}
