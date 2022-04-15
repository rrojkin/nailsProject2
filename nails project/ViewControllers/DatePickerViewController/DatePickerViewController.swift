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
    
    
    func showAlert() {
    let alert = UIAlertController(title: "Упс!", message: "На эту дату нет свободных мест :(", preferredStyle: .alert) //.alert
    let okAction = UIAlertAction(title: "Выбрать другую дату", style: .default)
    alert.addAction(okAction)
    
    present(alert, animated: true)
        HapticsManager.shared.selectionVibrate(for: .error)
    }
    
   
    
   
//    var fullDates = [String]()
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        if date .compare(Date()) == .orderedAscending {
        return false
    }
        for n in postData {
            
            let loc = Locale(identifier: "rus")
            
        let formatter = DateFormatter()
        formatter.locale = loc
        formatter.dateFormat =  "MM-dd-yyyy"

        guard let excludedDate = formatter.date(from: "\(n)") else { return true }
        if date.compare(excludedDate) == .orderedSame{
            return true
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
        
            guard let excludedDate = formatter.date(from: "\(n)") else { return nil }
        if date.compare(excludedDate) == .orderedSame,
           date.compare(calendar.today!) != .orderedAscending {
            return .red
        }
    }
        if date.compare(Date()) == .orderedAscending,
           date.compare(calendar.today!) != .orderedSame {
            return .gray
        }
        calendar.appearance.todayColor = .blue
        return nil
}
            

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        let loc = Locale(identifier: "rus")

        let formatter = DateFormatter()
        formatter.locale = loc
        
        
        
        formatter.dateFormat = "MM-dd-yyyy"
        
        for n in postData {
            guard let excludedDate = formatter.date(from: "\(n)") else { return }
            if date.compare(excludedDate) == .orderedSame{
                showAlert()
                return
            }
        }
        
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


    




