//
//  FirstViewController.swift
//  Photomorgana
//
//  Created by hilmy ghozy on 11/05/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import UIKit
import Photos

let reuseIdentifer = "photoCell"
let albumName = "My App"

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imagesArray :[UIImage] = []
    var albumFound : Bool = false
    var assetCollection: PHAssetCollection!
    var photoResult: PHFetchResult<AnyObject>!
    
    
    @IBAction func btnAddPhotos(_ sender: Any) {
        let picker:UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    @IBOutlet weak var CollectionView: UICollectionView!
    


            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let pickedimage = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage){
            imagesArray = [pickedimage]

        }
        CollectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell" , for: indexPath)
        
        return cell
    }
    

}

