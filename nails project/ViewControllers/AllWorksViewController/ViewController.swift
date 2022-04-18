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
    
    @IBOutlet weak var topBlurView: UIView!
    
    @IBOutlet weak var effectView: UIView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var worksCollection: UICollectionView!
        
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var finalTryForTheEffect: UIView!
    
    var dataSample = [UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3"),UIImage(named: "nails1"),UIImage(named: "nails2"),UIImage(named: "nails3")]
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBlurView.backgroundColor = nil
        view.bringSubviewToFront(topBlurView)
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: topBlurView.frame.width+20, height: topBlurView.frame.height)
        blurView.autoresizingMask = .flexibleHeight
        topBlurView.insertSubview(blurView, at: 0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 600, height: 1500)
        gradientLayer.colors = [#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor, UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor]
                gradientLayer.shouldRasterize = true
        
        worksCollection.backgroundColor = nil
        view.sendSubviewToBack(gradientView)
        gradientView.layer.addSublayer(gradientLayer)
        
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
         if indexPath.section % 2 == 0, indexPath.row % 2 == 0 {
             let numberInData = indexPath.section
             print(numberInData)
             cell.nailsImage.image = dataSample[numberInData]
         } else if indexPath.section % 2 != 0, indexPath.row % 2 != 0 {
             let numberInData = indexPath.section
             print(numberInData)
             cell.nailsImage.image = dataSample[numberInData]
         } else {
             cell.nailsImage.image = nil
             cell.backgroundview.backgroundColor = nil
         }
//        let numberInData = indexPath.row + indexPath.section*2
//        cell.nailsImage.image = dataSample[numberInData]
//
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath)

         if indexPath.section % 2 == 0, indexPath.row % 2 == 0 {
             showDescription()
         } else if indexPath.section % 2 != 0, indexPath.row % 2 != 0 {
             showDescription()
         } else {
             return
         }

         func showDescription() {
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




