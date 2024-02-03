// 
//  ResultPayProtocol.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

protocol VTPResultPayProtocol: AnyObject {
    var view: PTVResultPayProtocol? { get set }
    var interactor: PTIResultPayProtocol? { get set }
    var router: PTRResultPayProtocol? { get set }
    
    func goToHistory(nav: UINavigationController)
    func goToHome(nav: UINavigationController)
    func pushBackVC(nav: UINavigationController)
}

protocol PTVResultPayProtocol: AnyObject {
    
}

protocol PTIResultPayProtocol: AnyObject {
    var presenter: ITPResultPayProtocol? { get set }

}

protocol ITPResultPayProtocol: AnyObject {
    
}

protocol PTRResultPayProtocol: AnyObject {
    func navigateHistory(nav: UINavigationController)
    func navigateHome(nav: UINavigationController)
    func navigateBack(nav: UINavigationController)
}
