//
//  BuyButtonCell.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/2/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet weak var buyButton: UIButton!
    
    var product: Product! {
        didSet {
            buyButton.setTitle("BUY FOR $\(product.price!)", for: [])
        }
    }

}

















