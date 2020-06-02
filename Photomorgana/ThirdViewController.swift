//
//  ThirdViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 11/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController {

   
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.cornerRadius = profileImg.frame.size.height/2
        profileImg.clipsToBounds = true
        profileTable.dataSource = self
        profileTable.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionCell")

    }

}
extension ThirdViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Collect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as! ProfileTableViewCell
        let collection = Collect[indexPath.row]
        cell.commentCollection.text = collection.comment
        cell.likeCollection.text = collection.like
        cell.tagCollection.text = collection.tag
        cell.captionCollection.text = collection.caption
        cell.imageCollection.image = collection.imageCollection
        
        return cell
    }
    
    
}
