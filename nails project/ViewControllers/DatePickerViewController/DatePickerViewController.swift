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
 
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat =  "dd-MM-yyyy"
        let string = formatter.string(from: date)
        let TimePickerVC = TimePickerViewController(nibName: String(describing: TimePickerViewController.self), bundle: nil)
        TimePickerVC.dateText = string
        present(TimePickerVC, animated: true)
        
    }
    
}



