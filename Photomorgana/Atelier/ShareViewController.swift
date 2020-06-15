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
    let speech = SpeechService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImgSharePriview.image = newShareImage
        
        tabBarController?.tabBar.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePhoto))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backToAtelier))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToAtelier))
//        NotificationCenter.default.addObserver(self, selector: "animateWithKeyboard:", name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: "animateWithKeyboard:", name: UIResponder.keyboardWillHideNotification, object: nil)
        }
//    func animateWithKeyboard(notification: NSNotification) {
//
//        // Based on both Apple's docs and personal experience,
//        // I assume userInfo and its documented keys are available.
//        // If you'd like, you can remove the forced unwrapping and add your own default values.
//
//        let userInfo = notification.userInfo!
//        let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
//        let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let moveUp = (notification.name == UIResponder.keyboardWillShowNotification)
//
//        // baseContraint is your Auto Layout constraint that pins the
//        // text view to the bottom of the superview.
//
////        baseConstraint.constant = moveUp ? -keyboardHeight : 0
//
//        let options = UIView.AnimationOptions(rawValue: curve << 16)
//        UIView.animate(withDuration: duration, delay: 0, options: options,
//            animations: {
//                self.view.layoutIfNeeded()
//            },
//            completion: nil
//        )
//
//    
//    }
    override func viewDidAppear(_ animated: Bool) {
        let welcome = "You are in share screen."
        speech.say(welcome)
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
