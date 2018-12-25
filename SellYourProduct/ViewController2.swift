//
//  ViewController2.swift
//  SellYourProduct
//
//  Created by mugish on 17/09/18.
//  Copyright © 2018 SofTech. All rights reserved.
//

import UIKit
import IGRPhotoTweaks
import YPImagePicker
//import FirebaseStorage

class ViewController2: UIViewController {
    

    var config = YPImagePickerConfiguration()
    
    @IBOutlet var newProducts: [UIImageView]!
    
    
    fileprivate var image: UIImage!
    //let storageRef = Storage.storage().reference()
    
    override func viewDidLoad() {
        
       
        
        super.viewDidLoad()
        config.library.mediaType = .photoAndVideo
        config.library.onlySquare  = false
        config.onlySquareImagesFromCamera = true
        config.targetImageSize = .original
        config.usesFrontCamera = false
        config.showsFilters = true
        config.shouldSaveNewPicturesToAlbum = false
        //config.video.compression = AVAssetExportPresetHighestQuality
        config.albumName = "MyGreatAppName"
        config.screens = [.library, .photo, .video]
        config.startOnScreen = .library
        config.video.recordingTimeLimit = 10
        config.video.libraryTimeLimit = 20
        config.showsCrop = .none//.rectangle(ratio: (1/1))
        config.wordings.libraryTitle = "Gallery"
        config.hidesStatusBar = false
        //config.overlayView = myOverlayView
        config.library.maxNumberOfItems = 8
        config.library.minNumberOfItems = 1
        config.library.numberOfItemsInRow = 4
        config.library.spacingBetweenItems = 2
        config.isScrollToChangeModesEnabled = false
        
        if (self.image == nil) {
            openLibrary()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
     
        let editItem = UIBarButtonItem(title: "Rotate", style: .plain ,
                                       target: self,
                                       action: #selector(openEdit))
        
        let libraryItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                          target: self,
                                          action: #selector(openLibrary))
        
        self.navigationItem.leftBarButtonItem = libraryItem
        self.navigationItem.rightBarButtonItem = editItem
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCrop" {
            
            let exampleCropViewController = segue.destination as! ExampleCropViewController
            exampleCropViewController.image = sender as! UIImage
            exampleCropViewController.delegate = self
        }
    }
    
    
    // MARK: - Funcs
    
    @objc func openLibrary() {

        let picker = YPImagePicker(configuration: config)
        /*
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.image = photo.image
                self.imageView?.image = photo.image
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
*/
        
        //for multiple selection
        picker.didFinishPicking { [unowned picker] items, cancelled in
            var count = 0
            for item in items {
                print("\(item) This is item.......")
                switch item {
                case .photo(let photo):
                        self.newProducts[count].image = photo.image
                        count += 1
                    print(photo)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
 
    }
    
    @objc func openEdit() {
        self.edit(image: self.newProducts[0].image!)
    }
    
    func edit(image: UIImage) {
        self.performSegue(withIdentifier: "showCrop", sender: image)
    }
    
    
    @IBAction func saveBtnAction(_ sender: Any) {
        // Data in memory
        /*
        let data = Data()
        
        // Create a reference to the file you want to upload
        let riversRef = storageRef.child("images/rivers.jpg")
        
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            riversRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
        }*/
    }
    
    
    
}

extension ViewController2: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.image = image
        
        picker.dismiss(animated: true) {
            self.edit(image: image)
        }
    }
}

extension ViewController2: IGRPhotoTweakViewControllerDelegate {
    func photoTweaksController(_ controller: IGRPhotoTweakViewController, didFinishWithCroppedImage croppedImage: UIImage) {
        self.newProducts[0].image = croppedImage
        _ = controller.navigationController?.popViewController(animated: true)
    }
    
    func photoTweaksControllerDidCancel(_ controller: IGRPhotoTweakViewController) {
        _ = controller.navigationController?.popViewController(animated: true)
    }
}
