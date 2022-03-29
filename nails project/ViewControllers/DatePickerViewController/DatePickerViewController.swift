//
//  DatePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/8/22.
//

import FSCalendar
import UIKit

class DatePickerViewController: UIViewController, FSCalendarDelegate {
    
    
    
    @IBOutlet weak var viewOutlet: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutlet.delegate = self
        viewOutlet.backgroundColor = .gray
        viewOutlet.layer.cornerRadius = 10
        viewOutlet.layer.borderColor = UIColor.black.cgColor
        viewOutlet.layer.borderWidth = 1
        
    }
    var stringDate: String = ""
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        if date .compare(Date()) == .orderedAscending {
            return false
        }
        else {
            return true
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat =  "dd-MM-yyyy"
        let string = formatter.string(from: date)
        
        let timePickerVC = TimePickerViewController(nibName: String(describing: TimePickerViewController.self), bundle: nil)
        
        timePickerVC.dateText = string
        
        let navigation = UINavigationController(rootViewController: timePickerVC)
    
        
        present(navigation, animated: true)
        }
       
    }
    




