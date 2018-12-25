//
//  SuggestionCollectionViewCell.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            imageView.image = image
            setNeedsLayout()
        }
    }
}

























