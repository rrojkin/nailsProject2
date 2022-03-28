//
//  TimePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class TimePickerViewController: UIViewController{
    @IBOutlet weak var date: UILabel!
    var dateText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Свободные окошки"
        date.text = dateText
       
    }
    
    let registrationVC = RegistrationViewController(nibName: String(describing: RegistrationViewController.self), bundle: nil)
    
    @IBAction func onePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    @IBAction func twoPmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)    }
    
    @IBAction func threePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    
    
    
}

