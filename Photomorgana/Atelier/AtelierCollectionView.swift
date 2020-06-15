//
//  FirstViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 11/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit
import PixelEngine
import PixelEditor
import AVFoundation


class AtelierCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout, PixelEditViewControllerDelegate {
    let speech = SpeechService()
    var images = [UIImage]()
    let imageEdit = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Atelier"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPhoto))

    }
    override func viewDidAppear(_ animated: Bool) {
        let welcome = "You are in Atelier screen."
        speech.say(welcome)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageView", for: indexPath)
        
        let imageView = cell.viewWithTag(1000) as? UIImageView
        imageView?.image = images[indexPath.item]
        
        return cell
    }
    
    func pixelEditViewController(_ controller: PixelEditViewController, didEndEditing editingStack: EditingStack) {
        let imageEdit = editingStack.makeRenderer().render(resolution: .full)
        
        let optionMenu = UIAlertController(title: nil, message: "Save As", preferredStyle: .actionSheet)
            
        // 2
        let jpg = UIAlertAction(title: "JPG", style: .default){ action -> Void in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareViewController") as? ShareViewController {
                viewController.newShareImage = imageEdit
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        let png = UIAlertAction(title: "PNG", style: .default){ action -> Void in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareViewController") as? ShareViewController {
                viewController.newShareImage = imageEdit
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        let raw = UIAlertAction(title: "Raw", style: .default){ action -> Void in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareViewController") as? ShareViewController {
                viewController.newShareImage = imageEdit
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        let pdf = UIAlertAction(title: "PDF", style: .default){ action -> Void in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareViewController") as? ShareViewController {
                viewController.newShareImage = imageEdit
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
            
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
        // 4
        optionMenu.addAction(jpg)
        optionMenu.addAction(png)
        optionMenu.addAction(raw)
        optionMenu.addAction(pdf)
        optionMenu.addAction(cancelAction)
            
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    
    }
    
    func pixelEditViewControllerDidCancelEditing(in controller: PixelEditViewController) {
        let alert = UIAlertController(title: "Cancel", message: "This action will remove your change, are you sure want to cancel?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default) { action -> Void in
            self.navigationController?.popToViewController(self, animated: true)
            self.tabBarController?.tabBar.isHidden = false
        })
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    @objc func importPhoto(_ sender: Any){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        dismiss(animated: true, completion: nil)
        
        images.insert(image, at: 0 )
        collectionView.reloadData()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

extension AtelierCollectionView : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
          
        // 2
        let edit = UIAlertAction(title: "Edit", style: .default){ action -> Void in
            if UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditViewController") is EditViewController{
                let controller = PixelEditViewController.init(image : self.images[indexPath.row])
                    controller.delegate = self
                    self.tabBarController?.tabBar.isHidden = true
                    self.navigationController?.pushViewController(controller, animated: true)
                    let welcome = "You are in Edit screen."
                    self.speech.say(welcome)
                
                
            }
        }
        let share = UIAlertAction(title: "Share", style: .default){ action -> Void in
            if let share = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareDetailViewController") as? ShareDetailViewController {
                if let navigator = self.navigationController {
                    share.shareImagePriview = self.images[indexPath.row]
                    navigator.pushViewController(share, animated: true)
                }
            }
        }
        let delete = UIAlertAction(title: "Delete", style: .destructive)
          
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
          
        // 4
        optionMenu.addAction(edit)
        optionMenu.addAction(share)
        optionMenu.addAction(delete)
        optionMenu.addAction(cancelAction)
        
        
        //Accsessibility Element
        share.isAccessibilityElement = true
        share.accessibilityLabel = "Share your image to world"
        edit.isAccessibilityElement = true
        edit.accessibilityLabel = "Edit your image"
        delete.isAccessibilityElement = true
        delete.accessibilityLabel = "Delete your image"
        cancelAction.isAccessibilityElement = true
        cancelAction.accessibilityLabel = "cancel action"

        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
        
    }
}
