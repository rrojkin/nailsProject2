//
//  CollectionViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 4/17/22.
//

import UIKit
import AVFoundation

class CollectionViewController: UICollectionViewController {
    var photos = Photo.allPhotos()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
        print(photos)
        let nib = UINib(nibName: String(describing: newNailsCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: newNailsCollectionViewCell.self))
      collectionView?.backgroundColor = .white
      collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    }
  }

  extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: newNailsCollectionViewCell.self), for: indexPath as IndexPath) as! newNailsCollectionViewCell
        cell.photo.image = photos[indexPath.item].image
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }
  }
