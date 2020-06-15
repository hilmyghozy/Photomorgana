//
//  ExploreViewController.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 28/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
let speech = SpeechService()
    
    @IBOutlet weak var tag3: UILabel!
    @IBOutlet weak var tag2: UILabel!
    @IBOutlet weak var tag1: UILabel!
    @IBOutlet weak var exploreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Explore"
        tabBarController?.tabBar.isHidden = false

        //super.viewDidLoad()
        exploreTableView.dataSource = self
        exploreTableView.register(UINib(nibName: "ExpTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpCell")
        tag1.text = "City"
        tag2.text = "Transport"
        tag3.text = "Wedding"
        tag1.font = UIFont.preferredFont(forTextStyle: .body)
        tag1.adjustsFontForContentSizeCategory = true
        tag2.font = UIFont.preferredFont(forTextStyle: .body)
        tag2.adjustsFontForContentSizeCategory = true
        tag3.font = UIFont.preferredFont(forTextStyle: .body)
        tag3.adjustsFontForContentSizeCategory = true
        

    }
    
    

}
extension ExploreViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExploreDesc.count
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpCell", for: indexPath) as! ExpTableViewCell
        let explore = ExploreDesc[indexPath.row]
        cell.commentExp.isAccessibilityElement = true
        cell.commentExp.accessibilityValue = explore.commentExp
        speech.say("The comments for this photo are " + explore.commentExp)

        cell.likeExp.isAccessibilityElement = true
        cell.likeExp.accessibilityValue = explore.likeExp
        speech.say("The likes for this photo are " + explore.likeExp)

        cell.tagExp.isAccessibilityElement = true
        cell.tagExp.accessibilityValue = explore.tagExp
        speech.say("The tags for this photo are " + explore.tagExp)

        cell.profileName.isAccessibilityElement = true
        cell.profileName.accessibilityValue = explore.profileExp
        speech.say("The user who uploaded this photo is " + explore.profileExp)
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
        // Accessibility ELement for each component of cell in table view
//        cell.commentExp.isAccessibilityElement = true
//        cell.commentExp.accessibilityValue = explore.commentExp
//        speech.say("The comments for this photo are " + explore.commentExp)
//
//        cell.likeExp.isAccessibilityElement = true
//        cell.likeExp.accessibilityValue = explore.likeExp
//        speech.say("The likes for this photo are " + explore.likeExp)
//
//        cell.tagExp.isAccessibilityElement = true
//        cell.tagExp.accessibilityValue = explore.tagExp
//        speech.say("The tags for this photo are " + explore.tagExp)
//
//        cell.profileName.isAccessibilityElement = true
//        cell.profileName.accessibilityValue = explore.profileExp
//        speech.say("The user who uploaded this photo is " + explore.profileExp)
//
        return cell
    }
}
