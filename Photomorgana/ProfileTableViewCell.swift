//
//  ProfileTableViewCell.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 27/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCollection: UIImageView!
    @IBOutlet weak var captionCollection: UILabel!
    @IBOutlet weak var likeCollection: UILabel!
    @IBOutlet weak var commentCollection: UILabel!
    @IBOutlet weak var tagCollection: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
