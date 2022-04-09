//
//  NailsDescriptionViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/31/22.
//

import UIKit

protocol shouldAddBlurDelegate {
    func addBlur(blur : shouldBeBlured)
}

class NailsDescriptionViewController: UIViewController {
    
    var dataSample = [UIImage(named: "nails1before"), UIImage(named: "nails1"), UIImage(named: "nails2before"), UIImage(named: "nails2"),UIImage(named: "nails3before"), UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3")]
    
    var numberInData = 0
    
    var delegate: shouldAddBlurDelegate?
    
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var tableView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 5
        tableView.layer.cornerRadius = popUpView.layer.cornerRadius
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    
        
        let nib = UINib(nibName: String(describing: DescriptionCollectionViewCell.self), bundle: nil)
        
        self.tableView!.register(nib, forCellWithReuseIdentifier: String(describing: DescriptionCollectionViewCell.self))
        
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        let blur = shouldBeBlured(beBlured: true)
        delegate?.addBlur(blur: blur)
        }

    @IBAction func closeDescription(_ sender: Any) {
        let blur = shouldBeBlured(beBlured: true)
        delegate?.addBlur(blur: blur)
        navigationController?.dismiss(animated: true)
    }
}
    
extension NailsDescriptionViewController: UICollectionViewDelegate {
    
}
extension NailsDescriptionViewController:
    
    UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DescriptionCollectionViewCell.self) , for: indexPath) as! DescriptionCollectionViewCell
        
        cell.nailsImage.image = dataSample[indexPath.row + numberInData]
        
        return cell
    }
    
    
}
