//
//  TestCollectionViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/31/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class TestCollectionViewController: UICollectionViewController {
    
    
    var dataSample = [UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named:
                                                                                                                                                                                                                                                                                                        "nails1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        blurEffectView.effect = blurEffect
        
        view.addSubview(blurEffectView)
       
        let nib = UINib(nibName: String(describing: cellCollectionViewCell.self), bundle: nil)
        
        self.collectionView!.register(nib, forCellWithReuseIdentifier: String(describing: cellCollectionViewCell.self))

       
    }

   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellCollectionViewCell.self) , for: indexPath) as! cellCollectionViewCell
        cell.nailsImage.image = dataSample[indexPath.row]
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let numberInData = indexPath.row + indexPath.section*2 + 1
        print("selected \(numberInData)")
        
        let DescriptionVC = NailsDescriptionViewController(nibName: String(describing: NailsDescriptionViewController.self), bundle: nil)
        DescriptionVC.modalPresentationStyle = .overFullScreen
        DescriptionVC.modalTransitionStyle = .crossDissolve
        
        let navigation = UINavigationController(rootViewController: DescriptionVC)
        present(navigation, animated: true)

    
    }
    

}


