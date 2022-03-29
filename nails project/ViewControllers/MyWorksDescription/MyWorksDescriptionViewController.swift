//
//  MyWorksDescriptionViewController.swift
//  nails project
//
//  Created by Antony Razhnou on 3/29/22.
//

import UIKit

class MyWorksDescriptionViewController: UIViewController {

    @IBOutlet weak var beforeImageView: UIImageView!
    @IBOutlet weak var afterImageView: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var masterDescriptionLabel: UILabel!
    var imageNumber = 0
    var nails = [UIImage]()
    var nailsBefore = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nailsBefore.append(UIImage(imageLiteralResourceName: "nails1before"))
        nailsBefore.append(UIImage(imageLiteralResourceName: "nails2before"))
        nailsBefore.append(UIImage(imageLiteralResourceName: "nails3before"))
        
        afterImageView.image = nails[imageNumber]
        beforeImageView.image = nailsBefore[imageNumber]
    }

}
