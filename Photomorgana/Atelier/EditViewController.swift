//
//  EditViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 21/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit
import FittedSheets

class EditViewController: UIViewController {

    @IBOutlet weak var imgPriview: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPriview.image = newImage
        
        let controller = SecondViewController()

        let sheetController = SheetViewController(controller: controller, sizes: [.fixed(100), .fixed(200), .halfScreen])

        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController.blurBottomSafeArea = false
        sheetController.adjustForBottomSafeArea = true

        // Turn off rounded corners
        sheetController.topCornersRadius = 0

        // Make corners more round
        sheetController.topCornersRadius = 15

        // Disable the dismiss on background tap functionality
        sheetController.dismissOnBackgroundTap = false

        // Extend the background behind the pull bar instead of having it transparent
        sheetController.extendBackgroundBehindHandle = true
        
        // Change the overlay color
        sheetController.overlayColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0)
        // Change the handle color
        sheetController.handleColor = UIColor.orange

        self.present(sheetController, animated: false, completion: nil)
        
    }
    
    
    

}
