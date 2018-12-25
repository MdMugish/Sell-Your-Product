//
//  ViewController.swift
//  SellYourProduct
//
//  Created by mugish on 17/09/18.
//  Copyright © 2018 SofTech. All rights reserved.
//

import UIKit
import YPImagePicker


class ViewController: UIViewController {


    @IBOutlet weak var image1: UIImageView!
    
    var config = YPImagePickerConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        config.library.mediaType = .photoAndVideo
        config.library.onlySquare  = false
        config.onlySquareImagesFromCamera = true
        config.targetImageSize = .original
        config.usesFrontCamera = true
        config.showsFilters = true
        config.shouldSaveNewPicturesToAlbum = false
        //config.video.compression = AVAssetExportPresetHighestQuality
        config.albumName = "MyGreatAppName"
        config.screens = [.library, .photo, .video]
        config.startOnScreen = .library
        config.video.recordingTimeLimit = 10
        config.video.libraryTimeLimit = 20
        config.showsCrop = .rectangle(ratio: (1/1))
        config.wordings.libraryTitle = "Gallery"
        config.hidesStatusBar = false
        //config.overlayView = myOverlayView
        config.library.maxNumberOfItems = 5
        config.library.minNumberOfItems = 1
        config.library.numberOfItemsInRow = 3
        config.library.spacingBetweenItems = 2
        config.isScrollToChangeModesEnabled = false
        
      
    }

    

    
    
    @IBAction func selectImage(_ sender: Any) {
        
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
       
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.image1.image = photo.image
                self.image1.transform = self.image1.transform.rotated(by: CGFloat(M_PI_2))
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
            present(picker, animated: true, completion: nil)
        /*
         //for multiple selection
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    print(photo)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        */
    }
  
}
