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
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.6348838806, green: 0.2725093365, blue: 0.7711617947, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.5523809195, green: 0.2406863868, blue: 0.6685405374, alpha: 1)
    }
}

