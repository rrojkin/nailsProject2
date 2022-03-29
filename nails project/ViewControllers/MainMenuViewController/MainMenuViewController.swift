//
//  MainMenuViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/8/22.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func onlineRegistrationAction(_ sender: Any) {
        
         let datePickerVC = DatePickerViewController(nibName: String(describing: DatePickerViewController.self), bundle: nil)
        
        navigationController?.pushViewController(datePickerVC, animated: true)
        
        
    }
    
    @IBAction func myWorksAction(_ sender: Any) {
        let myWorksVC = MyWorksViewController(nibName: String(describing: MyWorksViewController.self), bundle: nil)
        navigationController?.pushViewController(myWorksVC, animated: true)
    }
    
}
