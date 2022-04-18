//
//  newNailsCollectionViewCell.swift
//  nails project
//
//  Created by Antony Razhnou on 4/17/22.
//

import UIKit

class newNailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var setPhoto: Photo? {
      didSet {
        if let photo3 = setPhoto {
            photo.image = photo3.image
        }
      }
    }

}
