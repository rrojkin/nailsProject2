//
//  MyWorksViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/29/22.
//

import UIKit

class MyWorksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var nails = [UIImage]()
    var imageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nails.append(UIImage(imageLiteralResourceName: "nails1"))
        nails.append(UIImage(imageLiteralResourceName: "nails2"))
        nails.append(UIImage(imageLiteralResourceName: "nails3"))
        tableView.dataSource = self
        setUpTable()
        
    }

    private func setUpTable() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: String(describing: MyWorksCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: MyWorksCell.self))
    }
    
}

extension MyWorksViewController: UITableViewDelegate {
    
}

extension MyWorksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyWorksCell.self), for: indexPath) as! MyWorksCell
        cell.nailsImage.image = nails[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionVC = MyWorksDescriptionViewController(nibName: String(describing: MyWorksDescriptionViewController.self), bundle: nil)
        descriptionVC.imageNumber = indexPath.row
        descriptionVC.nails = nails
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    
}
