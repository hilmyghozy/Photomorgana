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
        exploreTableView.dataSource = self
        exploreTableView.register(UINib(nibName:"ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "ExploreCell")
    }
    

}
extension ExploreViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExploreDesc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ex = tableView.dequeueReusableCell(withIdentifier: "ExploreCell", for: indexPath) as! ExploreTableViewCell
        let exp = ExploreDesc[indexPath.row]
        ex.commentCollection.text = exp.commentExp
        ex.likeCollection.text = exp.likeExp
        ex.tagImage.text = exp.tagExp
        ex.imageCollection.image = exp.imgExp
        ex.imageProfile.image = exp.imgProfileExp
        ex.profileName.text = exp.profileExp
        return ex
    }
    
    
}
