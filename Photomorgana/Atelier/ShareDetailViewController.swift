//
//  ShareDetailViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 02/06/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit
import TagListView

class ShareDetailViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var shareImgPriview: UIImageView!
    @IBOutlet weak var textFieldCaption: UITextField!
    @IBOutlet weak var viewCaption: UIView!
    @IBOutlet weak var biggerTagListView: TagListView!
    
    var shareImagePriview: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareImgPriview.image = shareImagePriview
        
        tabBarController?.tabBar.isHidden = true
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePhoto))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(sharePhoto))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backToAtelier))
        
        textFieldCaption.circleCorner()
        textFieldCaption.setBorder(width: 0.8, color: UIColor.gray)
        
        
        biggerTagListView.delegate = self
        biggerTagListView.textFont = .systemFont(ofSize: 15)
        biggerTagListView.shadowRadius = 1
        biggerTagListView.shadowOpacity = 0.7
        biggerTagListView.shadowColor = UIColor(rgb: 0xBECBD8)
        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        
        biggerTagListView.addTags(["Plant" ,"Architecture","Animal","Forest","Mountain","Transportation","Sport","Culture" ])
        biggerTagListView.alignment = .center
        
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExploreDesc.count
    }
    
    @objc func sharePhoto(_sender: Any){
        if let share = UIStoryboard(name: "Explore", bundle: nil).instantiateViewController(withIdentifier: "ExploreViewController") as? ExploreViewController {
            if let navigator = self.navigationController {
                navigator.pushViewController(share, animated: true)
            }
        }
    }
    
    @objc func backToAtelier(_sender: Any){
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }

}
extension UIView {
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    func circleCorner() {
        superview?.layoutIfNeeded()
        setCorner(radius: frame.height / 2)
    }
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

