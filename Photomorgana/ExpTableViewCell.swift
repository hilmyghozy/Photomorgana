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
        profileName.font = UIFont.preferredFont(forTextStyle: .body)
        profileName.adjustsFontForContentSizeCategory = true
        likeExp.font = UIFont.preferredFont(forTextStyle: .caption1)
        likeExp.adjustsFontForContentSizeCategory = true
        commentExp.font = UIFont.preferredFont(forTextStyle: .caption1)
        commentExp.adjustsFontForContentSizeCategory = true
        tagExp.font = UIFont.preferredFont(forTextStyle: .caption1)
        tagExp.adjustsFontForContentSizeCategory = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        profileImg.layer.cornerRadius = profileImg.frame.size.height/2
       profileImg.clipsToBounds = true
        // Configure the view for the selected state
    }
    
}
