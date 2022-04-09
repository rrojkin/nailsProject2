//
//  TestViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/31/22.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSample = [UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1"),UIImage(named: "nails1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: cellCollectionViewCell.self), bundle: nil)
        
        self.collectionView!.register(nib, forCellWithReuseIdentifier: String(describing: cellCollectionViewCell.self))
        
        collectionView.dataSource = self
        collectionView.delegate = self

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
       cell.nailsImage.image = dataSample[indexPath.row]
   
       return cell
   }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let numberInData = indexPath.row + indexPath.section*2 + 1
       print("selected \(numberInData)")
   }


   

}
