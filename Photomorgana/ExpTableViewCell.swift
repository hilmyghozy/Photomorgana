//
//  ExpTableViewCell.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 01/06/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ExpTableViewCell: UITableViewCell {

    @IBOutlet weak var commentExp: UILabel!
    @IBOutlet weak var likeExp: UILabel!
    @IBOutlet weak var tagExp: UILabel!
    @IBOutlet weak var imageCollection: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
