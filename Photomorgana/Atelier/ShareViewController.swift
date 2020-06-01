//
//  ShareViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 01/06/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var ImgSharePriview: UIImageView!
    var newShareImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImgSharePriview.image = newShareImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePhoto))
        
    }
    
    @objc func sharePhoto(_sender: Any){
        
    }

}
