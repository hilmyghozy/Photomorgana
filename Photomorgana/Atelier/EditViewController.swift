//
//  EditViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 21/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var imgPriview: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPriview.image = newImage
        // Do any additional setup after loading the view.
    }
    

}
