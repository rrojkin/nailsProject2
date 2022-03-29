//
//  TimePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit
import FirebaseDatabase

class TimePickerViewController: UIViewController {
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var onePmOutlet: UIButton!
    @IBOutlet weak var twoPmOutlet: UIButton!
    @IBOutlet weak var threePmOutlet: UIButton!
    
    let ref = Database.database(url: "https://nailsproject-9b8b3-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var dateText: String = ""
    var buttonSelected: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Свободные окошки"
        date.text = dateText
        registrationVC.date = dateText
        checkForAvalibility()
        secondCheckForAvalibility()
        thirdCheckForAvalibility()
        
        registrationVC.completeRegistration = self
    }
    let registrationVC = RegistrationViewController(nibName: String(describing: RegistrationViewController.self), bundle: nil)
    
        
    @IBAction func onePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "Час дня"
        buttonSelected = 1
    }
                                    
    
    @IBAction func twoPmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "Два часа дня"
        buttonSelected = 2
    }
    
    @IBAction func threePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "Три часа дня"
        buttonSelected = 3
    }
    
    
    func checkForAvalibility(){
        ref.child("\(dateText)/Час дня").observeSingleEvent(of: .value) {
            (snapshot) in
            let data = snapshot.value as? [String:String]
            guard let data = data else {return}
            print(data)
                self.onePmOutlet.setTitle("Запись занята", for: .normal)
                self.onePmOutlet.layer.borderColor = UIColor.red.cgColor
                self.onePmOutlet.layer.borderWidth = 1
                self.onePmOutlet.isEnabled = false
    }
}
    
    func secondCheckForAvalibility() {
        ref.child("\(dateText)/Два часа дня").observeSingleEvent(of: .value) {
            (snapshot) in
            let data = snapshot.value as? [String:String]
            guard let data = data else {return}
            print(data)
                self.twoPmOutlet.setTitle("Запись занята", for: .normal)
                self.twoPmOutlet.layer.borderColor = UIColor.red.cgColor
                self.twoPmOutlet.layer.borderWidth = 1
                self.twoPmOutlet.isEnabled = false
    }
}
    
    func thirdCheckForAvalibility() {
        ref.child("\(dateText)/Три часа дня").observeSingleEvent(of: .value) {
                (snapshot) in
                let data = snapshot.value as? [String:String]
                guard let data = data else {return}
            print(data)
                    self.threePmOutlet.setTitle("Запись занята", for: .normal)
                    self.threePmOutlet.layer.borderColor = UIColor.red.cgColor
                    self.threePmOutlet.layer.borderWidth = 1
                    self.threePmOutlet.isEnabled = false
    }
    
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

