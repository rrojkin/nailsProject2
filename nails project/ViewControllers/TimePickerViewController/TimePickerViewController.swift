//
//  TimePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class TimePickerViewController: UIViewController {
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var onePmOutlet: UIButton!
    @IBOutlet weak var twoPmOutlet: UIButton!
    @IBOutlet weak var threePmOutlet: UIButton!
    
    var dateText: String = ""
    var buttonSelected: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Свободные окошки"
        date.text = dateText
        
        registrationVC.completeRegistration = self
    }
    
    let registrationVC = RegistrationViewController(nibName: String(describing: RegistrationViewController.self), bundle: nil)
    
    @IBAction func onePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        buttonSelected = 1
    }
    
    @IBAction func twoPmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        buttonSelected = 2
    }
    
    @IBAction func threePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        buttonSelected = 3
    }
}

extension TimePickerViewController: RegistrationComplete {
    func RegistrationComplete(complete: Bool) {
        if complete {
            switch buttonSelected {
            case 1:  onePmOutlet.setTitle("Запись занята", for: .normal)
                onePmOutlet.layer.borderColor = UIColor.red.cgColor
                onePmOutlet.layer.borderWidth = 1
                onePmOutlet.isEnabled = false
                
            case 2: twoPmOutlet.setTitle("Запись занята", for: .normal)
                twoPmOutlet.layer.borderColor = UIColor.red.cgColor
                twoPmOutlet.layer.borderWidth = 1
                twoPmOutlet.isEnabled = false
                
            case 3: threePmOutlet.setTitle("Запись занята", for: .normal)
                threePmOutlet.layer.borderColor = UIColor.red.cgColor
                threePmOutlet.layer.borderWidth = 1
                threePmOutlet.isEnabled = false
               
            default: print("")
            }
        }
    }
}

