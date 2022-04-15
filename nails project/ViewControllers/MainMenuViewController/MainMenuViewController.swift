//
//  MainMenuViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/8/22.
//

import UIKit
import FirebaseDatabase

class MainMenuViewController: UIViewController {

    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var myWorksButton: UIButton!
    
    @IBOutlet weak var manicureLabel: UILabel!
    
    @IBOutlet weak var registrationShadow: UILabel!
    @IBOutlet weak var myWorksShadow: UILabel!
    
    var isFirstLaunch: Bool = true
    var timer: Timer?
    var fullDatesAtStart = [String]()
    
    let ref = Database.database(url: "https://nailsproject-9b8b3-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var dataBaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = UIColor.black.cgColor
        registrationButton.layer.cornerRadius = 5
        
        registrationShadow.layer.cornerRadius = 5
        registrationShadow.layer.borderColor = UIColor.black.cgColor
        registrationShadow.layer.borderWidth = 70
        
        myWorksShadow.layer.cornerRadius = 5
        myWorksShadow.layer.borderColor = UIColor.black.cgColor
        myWorksShadow.layer.borderWidth = 70
        
        myWorksButton.layer.borderWidth = 1
        myWorksButton.layer.borderColor = UIColor.black.cgColor
        myWorksButton.layer.cornerRadius = 5
        
        
        registrationButton.addTarget(self, action: #selector(holdRelease), for: .touchUpInside);
      registrationButton.addTarget(self, action: #selector(heldDown), for: .touchDown)
       registrationButton.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)
        
        myWorksButton.addTarget(self, action: #selector(holdRelease), for: .touchUpInside);
      myWorksButton.addTarget(self, action: #selector(heldDownMyWorks), for: .touchDown)
       myWorksButton.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)

        
        addToPostData()
    }
    
    func addToPostData() {
           dataBaseHandle = ref.child("Dates").observe(.childAdded, with: {
               (snapshot) in
               if snapshot.hasChild("one"),
                  snapshot.hasChild("two"),
                  snapshot.hasChild("three") {
                   self.fullDatesAtStart.append(snapshot.key)
               }
           })
   
       }
    
    

    @objc func heldDown()
    {
        HapticsManager.shared.vibrate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true, block: { _ in
           
            self.registrationButton.frame.origin.x += 1
            self.registrationButton.frame.origin.y += 1
            if self.registrationButton.frame.origin.y >= self.registrationShadow.frame.origin.y {
                self.timer?.invalidate()
                self.timer = nil
            }
        })
    }
    
    @objc func heldDownMyWorks()
    {
        HapticsManager.shared.vibrate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true, block: { _ in
           
            self.myWorksButton.frame.origin.x += 1
            self.myWorksButton.frame.origin.y += 1
            if self.myWorksButton.frame.origin.y >= self.myWorksShadow.frame.origin.y {
                self.timer?.invalidate()
                self.timer = nil
            }
        })
    }

    @objc func holdRelease()
    {
        self.timer?.invalidate()
        self.timer = nil
    }

    @objc func buttonHeldAndReleased(){
        self.timer?.invalidate()
        self.timer = nil
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstLaunch {
        manicureLabel.center.x = view.center.x
        manicureLabel.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: { [self] in
            manicureLabel.center.x += view.bounds.width
            view.layoutIfNeeded()
        }, completion: nil)
            isFirstLaunch = false
        }
    }
    
   

    @IBAction func onlineRegistrationAction(_ sender: Any) {
        addToPostData()
        let datePickerVC = DatePickerViewController(nibName: String(describing: DatePickerViewController.self), bundle: nil)
        datePickerVC.postData = self.fullDatesAtStart
        navigationController?.pushViewController(datePickerVC, animated: true)
        
        
    }
     
    
    @IBAction func myWorksAction(_ sender: Any) {
        let myWorksVC = ViewController(nibName: String(describing: ViewController.self), bundle: nil)
        navigationController?.pushViewController(myWorksVC, animated: true)
    }
    
    @IBAction func goToInstagram(_ sender: Any) {
        showAlert(name: "Instagram")
    }
    
    @IBAction func goToTelegram(_ sender: Any) {
        showAlert(name: "Telegram")
    }
    
    func showAlert(name: String) {
        let alert = UIAlertController(title: "Вы хотите перейти в \(name)?", message: "", preferredStyle: .alert) //.alert
        let okAction = UIAlertAction(title: "ОК", style: .default) { result in
            if name == "Instagram" {
                let instagramHooks = "https://www.instagram.com/manicure.haus/"
                let instagramUrl = URL(string: instagramHooks)!
                if UIApplication.shared.canOpenURL(instagramUrl)
                {
                    UIApplication.shared.open(instagramUrl)
                } else {
                    UIApplication.shared.open(URL(string: "http://instagram.com/")!)
                }
            } else {
                let instagramHooks = "https://t.me/darya4700"
                let instagramUrl = URL(string: instagramHooks)!
                if UIApplication.shared.canOpenURL(instagramUrl)
                {
                    UIApplication.shared.open(instagramUrl)
                } else {
                    UIApplication.shared.open(URL(string: "http://t.me/")!)
                }
            }
        }
        let noAction = UIAlertAction(title: "NO", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    
    
}



