//
//  TestProjectApp.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import SwiftUI

@main
struct TestProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView { MyViewController()}
            .navigationViewStyle(StackNavigationViewStyle()) // Optional styling
        }
    }
}

struct MyViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = HomeRouter.createHomeModule()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
