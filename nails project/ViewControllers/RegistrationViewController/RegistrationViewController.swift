//
//  RegistrationViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class RegistrationViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var ServiceTable: UITableView!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var socialMediaInput: UITextField!
    
    var resultServices = [String]()
    
    let services = ["Маникюр без покрытия","Маникюр с покрытием гель-лаком","Маникюр с укреплением гелем","Наращивание ногтей","Коррекция наращивания"]
    let servicesDescription = ["","Снятие, комбинированный маникюр, ремонт мелких трещин, покрытие, несложный дизайн","Снятие, комбинированный маникюр, ремонт мелких трещин, укрепление гелем, покрытие, несложный дизайн","Комбинированный маникюр, наращивание ногтей, покрытие, несложный дизайн","Снятие, комбинированный маникюр, донаращивание/ремонт ногтей, укрепление гелем, несложный дизайн"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: RegistrationCellTableViewCell.self), bundle: nil)
        ServiceTable.register(nib, forCellReuseIdentifier: String(describing: RegistrationCellTableViewCell.self))
        
        self.hideKeyboardWhenTappedAround()
        self.ServiceTable.allowsMultipleSelection = true
        self.ServiceTable.allowsMultipleSelectionDuringEditing = true
        
        ServiceTable.layer.borderWidth = 1
        ServiceTable.layer.borderColor = UIColor.black.cgColor
        ServiceTable.layer.cornerRadius = 10
        ServiceTable.dataSource = self
        ServiceTable.delegate = self
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if nameInput.text?.count == 0 || phoneInput.text?.count == 0 || socialMediaInput.text?.count == 0 {
            showAlert()
        } else {
            navigationController?.popViewController(animated: true)
            nameInput.text = ""
            phoneInput.text = ""
            socialMediaInput.text = "" }
        print(resultServices)
    }

    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Поля не могут быть пустыми", preferredStyle: .alert) //.alert
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resultServices.append(services[indexPath.row])
        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var index = 0
        for n in resultServices {
            if n == "\(services[indexPath.row])" {
                resultServices.remove(at: index)
            } else {
                index += 1
            }
        }
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
