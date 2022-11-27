//
//  AppDelegate.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.router.start()
        confiureView()
        
        return true
    }
    
    private func confiureView() {
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}

