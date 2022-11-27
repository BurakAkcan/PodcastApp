//
//  BaseTabbarController.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import UIKit
import Alamofire

class BaseTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .clear
        tabBar.tintColor = #colorLiteral(red: 0.613535881, green: 0.2683920264, blue: 0.7540130019, alpha: 1)
        tabBar.unselectedItemTintColor = .gray.withAlphaComponent(0.4)
        setTabbars()
       
        
        
    }
    
    //MARK: - Helper Functions
    
    private func setTabbars() {
        viewControllers = [
            createNavController(viewController: SearchVC(), imageName: "magnifyingglass", title: "Search"),
            createNavController(viewController: HomeVC(), imageName: "house", title: "Home"),
            
            createNavController(viewController: UIViewController(), imageName: "plus.rectangle.on.folder", title: "Download")
        ]
    }
    
    private func createNavController(viewController: UIViewController, imageName: String, title: String ) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.title = title
        return navController
        
    }
}
