//
//  SettingsController.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 02/06/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var profieImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profieImg.layer.cornerRadius = profieImg.frame.size.height/2
        profieImg.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
