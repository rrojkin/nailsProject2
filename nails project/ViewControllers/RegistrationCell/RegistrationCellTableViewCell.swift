//
//  RegistrationCellTableViewCell.swift
//  nails project
//
//  Created by Antony Razhnou on 3/10/22.
//

import UIKit

class RegistrationCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var SelectionOutlet: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SelectionOutlet.layer.borderWidth = 1
        SelectionOutlet.layer.borderColor = UIColor.black.cgColor
        SelectionOutlet.layer.cornerRadius = 9
        SelectionOutlet.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            SelectionOutlet.isHidden = false
        } else {
            SelectionOutlet.isHidden = true
        }
       
    }
}
