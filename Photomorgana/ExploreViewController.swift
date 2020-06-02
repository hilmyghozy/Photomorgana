//
//  ExploreViewController.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 28/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    
    @IBOutlet weak var exploreTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        exploreTableView.dataSource = self
//        exploreTableView.register(UINib(nibName:"ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "CellExplore")
//    }
//
//
//}
//extension ExploreViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ExploreDesc.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellExplore", for: indexPath) as! ExploreTableViewCell
//        let exp = ExploreDesc[indexPath.row]
//        cell.commentCollection.text = exp.commentExp
//        cell.likeCollection.text = exp.likeExp
//        cell.tagImage.text = exp.tagExp
//        cell.imageCollection.image = exp.imgExp
//        cell.imageProfile.image = exp.imgProfileExp
//        cell.profileName.text = exp.profileExp
//        return cell
//    }
//
//
//}
        //super.viewDidLoad()
        exploreTableView.dataSource = self
        exploreTableView.register(UINib(nibName: "ExpTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpCell")

    }

}
extension ExploreViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExploreDesc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpCell", for: indexPath) as! ExpTableViewCell
        let explore = ExploreDesc[indexPath.row]
        cell.commentExp.text = explore.commentExp
        cell.likeExp.text = explore.likeExp
        cell.tagExp.text = explore.tagExp
        cell.imageCollection.image = explore.imgExp
        cell.profileImg.image = explore.imgProfileExp
        cell.profileName.text = explore.profileExp
        
        return cell
    }
}
