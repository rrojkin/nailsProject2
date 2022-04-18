//
//  TestCollectionViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 4/18/22.
//

import UIKit
import AVFoundation

class TestCollectionViewController: UICollectionViewController {
    
    var blurEffect: UIBlurEffect? = nil
    let blurView = UIVisualEffectView(effect: nil)

    var photos = Photo.allPhotos()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
        let nib = UINib(nibName: String(describing: TestCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: TestCollectionViewCell.self))
        

        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
    }
}

extension TestCollectionViewController: UICollectionViewDelegateFlowLayout {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath as IndexPath) as! TestCollectionViewCell
    cell.photo = photos[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        showDescription()
    }
    
    func showDescription() {
   let DescriptionVC = NailsDescriptionViewController(nibName: String(describing: NailsDescriptionViewController.self), bundle: nil)
    DescriptionVC.modalPresentationStyle = .fullScreen
    DescriptionVC.modalTransitionStyle = .crossDissolve
        
        DescriptionVC.delegate = self
        
        blurView.frame = self.view.frame
        blurView.autoresizingMask = .flexibleHeight
        
        UIView.animate(withDuration: 0.5) {
            
            self.view.insertSubview(self.blurView, aboveSubview: self.collectionView)
            self.blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            self.blurView.effect = self.blurEffect
        }
  

    let navigation = UINavigationController(rootViewController: DescriptionVC)
    navigationController?.present(navigation, animated: true)
    }
}

extension TestCollectionViewController: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        print(photos[indexPath.item])
        return photos[indexPath.item].image.size.height
  }
}

extension TestCollectionViewController: shouldAddBlurDelegate {
    
    func addBlur(blur: shouldBeBlured) {
        if blur.beBlured == true {
            UIView.animate(withDuration: 0.3) {
                self.blurView.effect = nil
                self.blurEffect = nil
            } completion: { _ in
                self.view.sendSubviewToBack(self.blurView)
            }
        }
    }
}



 
