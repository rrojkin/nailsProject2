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
        tabBar.layer.opacity = 1
        tabBar.backgroundColor = .none
        tabBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = .flexibleHeight
        tabBar.insertSubview(blurView, at: 0)
        
        let mainMenuVC = MainMenuViewController()
        let profileVC = ProfileViewController()
        let myworksVC = TestCollectionViewController.init(nibName: "TestCollectionViewController", bundle: nil)
        mainMenuVC.title = "Home"
        profileVC.title = "Profile"
        myworksVC.title = "Works"
        
        tabBar.barTintColor = .label
        tabBar.tintColor = .label
        
        
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
