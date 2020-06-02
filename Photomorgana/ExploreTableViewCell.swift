//
//  ExploreTableViewCell.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 28/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var likeCollection: UILabel!
    @IBOutlet weak var imageCollection: UIImageView!
    
    @IBOutlet weak var tagImage: UILabel!
    @IBOutlet weak var commentCollection: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
