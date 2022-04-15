//
//  StartScreenViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 4/9/22.
//

import UIKit

class StartScreenViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.backgroundColor = nil
        
        
        let mainMenuVC = MainMenuViewController()
        let profileVC = ProfileViewController()
        let myworksVC = ViewController()
        
        mainMenuVC.title = "Home"
        profileVC.title = "Profile"
        myworksVC.title = "Works"
        
        self.setViewControllers([mainMenuVC, profileVC, myworksVC], animated: true)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["house", "person", "star"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
    }
}
