//
//  TestCollectionViewCell.swift
//  nails project
//
//  Created by Antony Razhnou on 4/18/22.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var back: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        back.backgroundColor = .red
        back.layer.cornerRadius = 10


    }
    
    var photo: Photo? {
      didSet {
        if let photo = photo {
          imageView.image = photo.image
  //        captionLabel.text = photo.caption
//          commentLabel.text = photo.comment
        }
      }
    }


}
