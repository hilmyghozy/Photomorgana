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
        captionCollection.font = UIFont.preferredFont(forTextStyle: .body)
        captionCollection.adjustsFontForContentSizeCategory = true
        likeCollection.font = UIFont.preferredFont(forTextStyle: .caption1)
        likeCollection.adjustsFontForContentSizeCategory = true
        commentCollection.font = UIFont.preferredFont(forTextStyle: .caption1)
        commentCollection.adjustsFontForContentSizeCategory = true
        tagCollection.font = UIFont.preferredFont(forTextStyle: .caption1)
        tagCollection.adjustsFontForContentSizeCategory = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
