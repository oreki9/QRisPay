// 
//  ScanProtocol.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

protocol VTPScanProtocol: AnyObject {
    var view: PTVScanProtocol? { get set }
    var interactor: PTIScanProtocol? { get set }
    var router: PTRScanProtocol? { get set }
    func goToScreenSuccess(data: ResultPayEntity, nav: UINavigationController)
    func pushBackVC(nav: UINavigationController)
}

protocol PTVScanProtocol: AnyObject {
    
}

protocol PTIScanProtocol: AnyObject {
    var presenter: ITPScanProtocol? { get set }

}

protocol ITPScanProtocol: AnyObject {
    
}

protocol PTRScanProtocol: AnyObject {
    func navigateSuccess(data: ResultPayEntity, nav: UINavigationController)
    func navigateBackVC(nav: UINavigationController)
}
