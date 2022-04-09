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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
