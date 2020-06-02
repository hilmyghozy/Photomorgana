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
        
        tabBarController?.tabBar.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePhoto))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backToAtelier))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToAtelier))
    }
    
    @objc func sharePhoto(_sender: Any){
        if let share = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareDetailViewController") as? ShareDetailViewController {
            if let navigator = self.navigationController {
                share.shareImagePriview = newShareImage
                navigator.pushViewController(share, animated: true)
            }
        }
    }
    @objc func backToAtelier(_sender: Any){
        for viewcontroller in self.navigationController!.viewControllers as Array {
            if viewcontroller.isKind(of: AtelierCollectionView.self) {
                self.navigationController?.popToViewController(viewcontroller , animated: true)
                break
            }
        }
    }
    

}
