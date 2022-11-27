//
//  AppRouter.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 27.11.2022.
//

import UIKit

final class AppRouter {
    let window : UIWindow

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let tabbar = BaseTabbarController()
        window.rootViewController = tabbar
        window.makeKeyAndVisible()
    }
}
