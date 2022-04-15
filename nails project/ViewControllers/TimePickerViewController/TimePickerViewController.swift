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
    
    @IBOutlet weak var emptyTimeslots: UILabel!
    @IBOutlet weak var wholeView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var onePmOutlet: UIButton!
    @IBOutlet weak var twoPmOutlet: UIButton!
    @IBOutlet weak var threePmOutlet: UIButton!
    
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    var dateForFireBase: String = ""
    
    let ref = Database.database(url: "https://nailsproject-9b8b3-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var dateText: String = ""
    var buttonSelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteView))
        wholeView.addGestureRecognizer(tap)
        
        timeView.layer.cornerRadius = 20
        registrationVC.date = dateText
        
        onePmOutlet.isEnabled = false
        twoPmOutlet.isEnabled = false
        threePmOutlet.isEnabled = false
        
        onePmOutlet.isHidden = true
        twoPmOutlet.isHidden = true
        threePmOutlet.isHidden = true
        
        title = ""
        date.text = ""
        
        
        checkForAvalibility()
        secondCheckForAvalibility()
        thirdCheckForAvalibility()
        
        registrationVC.completeRegistration = self
    }
    
    let registrationVC = RegistrationViewController(nibName: String(describing: RegistrationViewController.self), bundle: nil)
    
        
    @IBAction func onePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "one"
        buttonSelected = 1
        registrationVC.dateForFireBase = dateForFireBase
    }
                                    
    
    @IBAction func twoPmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "two"
        buttonSelected = 2
        registrationVC.dateForFireBase = dateForFireBase
    }
    
    @IBAction func threePmButton(_ sender: Any) {
        navigationController?.pushViewController(registrationVC, animated: true)
        registrationVC.time = "three"
        buttonSelected = 3
        registrationVC.dateForFireBase = dateForFireBase
    }
    
    
    func checkForAvalibility(){
        ref.child("Dates/\(dateForFireBase)/one").observeSingleEvent(of: .value) {
            (snapshot) in
            let data = snapshot.value as? [String:String]
            guard let data = data else {
                self.onePmOutlet.isEnabled = true
                self.onePmOutlet.isHidden = false
                return
            }
            print(data)
                self.onePmOutlet.setTitle("Запись занята", for: .normal)
                self.onePmOutlet.layer.borderColor = UIColor.red.cgColor
                self.onePmOutlet.layer.borderWidth = 1
            self.onePmOutlet.isHidden = false
    }
}
    
    func secondCheckForAvalibility() {
        ref.child("Dates/\(dateForFireBase)/two").observeSingleEvent(of: .value) {
            (snapshot) in
            let data = snapshot.value as? [String:String]
            guard let data = data else {
                self.twoPmOutlet.isEnabled = true
                self.twoPmOutlet.isHidden = false
                return
            }
            print(data)
                self.twoPmOutlet.setTitle("Запись занята", for: .normal)
                self.twoPmOutlet.layer.borderColor = UIColor.red.cgColor
                self.twoPmOutlet.layer.borderWidth = 1
            self.twoPmOutlet.isHidden = false
    }
}
    
    func thirdCheckForAvalibility() {
        ref.child("Dates/\(dateForFireBase)/three").observeSingleEvent(of: .value) {
                (snapshot) in
                let data = snapshot.value as? [String:String]
                guard let data = data else {
                    self.threePmOutlet.isEnabled = true
                    self.threePmOutlet.isHidden = false
                    self.date.text = self.dateText
                    self.emptyTimeslots.text = "Свободные окошки"
                    self.loaderIndicator.isHidden = true
                    return
                }
            print(data)
                    self.threePmOutlet.setTitle("Запись занята", for: .normal)
                    self.threePmOutlet.layer.borderColor = UIColor.red.cgColor
                    self.threePmOutlet.layer.borderWidth = 1
            self.threePmOutlet.isHidden = false
            self.date.text = self.dateText
            self.emptyTimeslots.text = "Свободные окошки"
            self.loaderIndicator.isHidden = true
    }
    
}
    
    @objc func deleteView() {
        navigationController?.dismiss(animated: true)
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


