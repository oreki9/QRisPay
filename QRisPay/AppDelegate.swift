//
//  AppDelegate.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create the UIWindow and set the root view controller
        if(AppSetting.shared.isFirstUseApp){
            AppSetting.shared.balance = 5000000000
        }
        AppSetting.shared.isFirstUseApp = false
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController(rootViewController: HomeRouter.createHomeModule())
        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()

        return true
    }
}
