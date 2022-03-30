//
//  DatePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/8/22.
//

import FSCalendar
import UIKit
import FirebaseDatabase

class DatePickerViewController: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    let ref = Database.database(url: "https://nailsproject-9b8b3-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var dataBaseHandle: DatabaseHandle?

    var postData = [String]()
    var justAdate: String = ""

    @IBOutlet weak var viewOutlet: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()


        viewOutlet.delegate = self
        viewOutlet.backgroundColor = .white
        viewOutlet.layer.cornerRadius = 10
        viewOutlet.layer.borderColor = UIColor.black.cgColor
        viewOutlet.layer.borderWidth = 1
        
        let loc = Locale(identifier: "rus")
        self.viewOutlet.locale = loc
        viewOutlet.appearance.headerDateFormat = "MMMM"
    }
    

    
    
    
    var stringDate: String = ""
    
   
    
   
//    var fullDates = [String]()
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        for n in postData {
            
            let loc = Locale(identifier: "rus")
            
        let formatter = DateFormatter()
        formatter.locale = loc
        formatter.dateFormat =  "MM-dd-yyyy"
//        let string = formatter.string(from: date)
        guard let excludedDate = formatter.date(from: "\(n)") else { return true }
        if date.compare(excludedDate) == .orderedSame{
            return false
        }
            if date .compare(Date()) == .orderedAscending {
            return false
        }
        }
        return true
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        for n in postData {
            
            let loc = Locale(identifier: "rus")
            
        let formatter = DateFormatter()
        formatter.locale = loc
        formatter.dateFormat =  "MM-dd-yyyy"
//        let string = formatter.string(from: date)
            guard let excludedDate = formatter.date(from: "\(n)") else { return nil }
        if date.compare(excludedDate) == .orderedSame{
            return .purple
        }
        }
        return nil
    }
            

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        let loc = Locale(identifier: "rus")

        let formatter = DateFormatter()
        formatter.locale = loc
        
        formatter.dateFormat = "MM-dd-yyyy"
        let dateForFireBase = formatter.string(from: date)
        
        formatter.dateFormat =  "d MMMM , EEEE, yyyy"
        let string = formatter.string(from: date)

        let timePickerVC = TimePickerViewController(nibName: String(describing: TimePickerViewController.self), bundle: nil)

        timePickerVC.dateText = string
        timePickerVC.dateForFireBase = dateForFireBase

        let navigation = UINavigationController(rootViewController: timePickerVC)


        present(navigation, animated: true)
        }
    
}


    




