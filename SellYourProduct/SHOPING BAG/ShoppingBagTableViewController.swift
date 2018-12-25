//
//  ShoppingBagTableViewController.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController
{
    var products: [Product]?
    
    struct Storyboard {
        static let numberOfItemsCell = "numberOfItemsCell"
        static let itemCell = "itemCell"
        static let cartDetailCell = "cartDetailCell"
        static let totalCell = "totalCell"
        static let checkoutButtonCell = "checkoutButtonCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchProducts()
    }
    
    func fetchProducts()
    {
        products = Product.fetchProducts()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ShoppingBagTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let products = products {
            return products.count + 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let products = products else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = "0 ITEM"
            return cell
        }
        
        if indexPath.row == 0 {
            // number of items cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = (products.count == 1) ? "\(products.count) ITEM" : "\(products.count) ITEMS"
            return cell
            
        } else if indexPath.row == products.count + 1 {
            // cart detail cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath)
            
            // TODO: - update the cart's info
            
            return cell
            
        } else if indexPath.row == products.count + 2 {
            // cart total cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCell, for: indexPath)
            
            
            return cell
            
        } else if indexPath.row == products.count + 3 {
            // checkout button cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkoutButtonCell, for: indexPath)
            
            return cell
            
            
        } else {
            // item cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.itemCell, for: indexPath) as! ShoppingCartItemCell
            cell.product = products[indexPath.row - 1]
            return cell
        }
    }
}

























