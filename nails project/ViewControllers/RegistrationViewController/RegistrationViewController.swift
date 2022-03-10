//
//  RegistrationViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class RegistrationViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var ServiceTable: UITableView!
    
    let services = ["Маникюр без покрытия","Маникюр с покрытием гель-лаком","Маникюр с укреплением гелем","Наращивание ногтей","Коррекция наращивания"]
    let servicesDescription = ["","Снятие, комбинированный маникюр, ремонт мелких трещин, покрытие, несложный дизайн","Снятие, комбинированный маникюр, ремонт мелких трещин, укрепление гелем, покрытие, несложный дизайн","Комбинированный маникюр, наращивание ногтей, покрытие, несложный дизайн","Снятие, комбинированный маникюр, донаращивание/ремонт ногтей, укрепление гелем, несложный дизайн"]

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceTable.layer.borderWidth = 1
        ServiceTable.layer.borderColor = UIColor.black.cgColor
        ServiceTable.layer.cornerRadius = 10
        ServiceTable.dataSource = self
        ServiceTable.delegate = self
        let nib = UINib(nibName: String(describing: RegistrationCellTableViewCell.self), bundle: nil)
        ServiceTable.register(nib, forCellReuseIdentifier: String(describing: RegistrationCellTableViewCell.self))
    }
    

    
    
    
}

extension RegistrationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RegistrationCellTableViewCell.self), for: indexPath)
        
        guard let registrationCell = cell as? RegistrationCellTableViewCell else { return cell }
        registrationCell.serviceLabel.text = services[indexPath.row]
        registrationCell.descriptionLabel.text = servicesDescription[indexPath.row]
        return registrationCell
    }
}
