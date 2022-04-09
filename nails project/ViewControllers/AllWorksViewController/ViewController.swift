//
//  ViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 4/1/22.
//

import UIKit

struct shouldBeBlured {
    var beBlured: Bool
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var effectView: UIView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var worksCollection: UICollectionView!
        
    @IBOutlet weak var finalTryForTheEffect: UIView!
    
    var dataSample = [UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3")]
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sendSubviewToBack(finalTryForTheEffect)
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
                
        worksCollection.dataSource = self
        worksCollection.delegate = self
        
        let nib = UINib(nibName: String(describing: cellCollectionViewCell.self), bundle: nil)
        
        self.worksCollection!.register(nib, forCellWithReuseIdentifier: String(describing: cellCollectionViewCell.self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ya rodilsya")
    }
   

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
         
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellCollectionViewCell.self) , for: indexPath) as! cellCollectionViewCell
        let numberInData = indexPath.row + indexPath.section*2
        cell.nailsImage.image = dataSample[numberInData]
    
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let numberInData = indexPath.row + indexPath.section*2 + 1
         
         let DescriptionVC = NailsDescriptionViewController(nibName: String(describing: NailsDescriptionViewController.self), bundle: nil)
         DescriptionVC.modalPresentationStyle = .fullScreen
         DescriptionVC.modalTransitionStyle = .crossDissolve
         DescriptionVC.delegate = self
         
         DescriptionVC.numberInData = (numberInData - 1) * 2
         
                  self.view.bringSubviewToFront(finalTryForTheEffect)
         
         UIView.animate(withDuration: 0.3){
            
             self.visualEffectView.effect = self.effect
             
         }
         
         let navigation = UINavigationController(rootViewController: DescriptionVC)
         navigationController?.present(navigation, animated: true)
         
    }

}

extension ViewController: shouldAddBlurDelegate {
    func addBlur(blur: shouldBeBlured) {
        if blur.beBlured == true {
            UIView.animate(withDuration: 0.3) {
                self.visualEffectView.effect = nil
            } completion: { _ in
                self.view.sendSubviewToBack(self.finalTryForTheEffect)
            }
        }
    }
}


