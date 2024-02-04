// 
//  DetailProtocol.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

protocol VTPDetailProtocol: AnyObject {
    var view: PTVDetailProtocol? { get set }
    var interactor: PTIDetailProtocol? { get set }
    var router: PTRDetailProtocol? { get set }
    func goToBack(nav: UINavigationController)
}

protocol PTVDetailProtocol: AnyObject {
    
}

protocol PTIDetailProtocol: AnyObject {
    var presenter: ITPDetailProtocol? { get set }

}

protocol ITPDetailProtocol: AnyObject {
    
}

protocol PTRDetailProtocol: AnyObject {
    func navigateToBack(nav: UINavigationController)
}
