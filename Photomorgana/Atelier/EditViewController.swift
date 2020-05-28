//
//  EditViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 21/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

import PixelEngine
import PixelEditor

class EditViewController: UIViewController {

    @IBOutlet weak var imgPriview: UIImageView!
    
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPriview.image = newImage
    }
}

extension EditViewController : PixelEditViewControllerDelegate {
  
  func pixelEditViewController(_ controller: PixelEditViewController, didEndEditing editingStack: EditingStack) {
    self.navigationController?.popToViewController(self, animated: true)
    let image = editingStack.makeRenderer().render(resolution: .full)
    self.imgPriview.image = image
    //self.imageView.image = image
  }
  
  func pixelEditViewControllerDidCancelEditing(in controller: PixelEditViewController) {
    self.navigationController?.popToViewController(self, animated: true)
  }
}

