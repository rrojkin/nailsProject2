//
//  TimePickerViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class TimePickerViewController: UIViewController {
    @IBOutlet weak var date: UILabel!
    var dateText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = "Свободные окошки на \(dateText)"
       
    }
}
