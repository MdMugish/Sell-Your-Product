//
//  ProductDetailCell.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/2/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!

    var product: Product? {
        didSet {
            productNameLabel.text = product?.name
            productDescriptionLabel.text = product?.description
        }
    }
}

















