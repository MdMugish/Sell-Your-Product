//
//  ShoppingCartItemCell.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ShoppingCartItemCell: UITableViewCell
{
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var product: Product! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        productImageView.image = product.images?.first
        productNameLabel.text = product.name
        priceLabel.text = "Rs.\(product.price!)"
    }
    
}



















