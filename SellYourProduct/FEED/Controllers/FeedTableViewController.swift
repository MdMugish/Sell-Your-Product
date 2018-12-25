//
//  FeedTableViewController.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/2/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit


class FeedTableViewController: UITableViewController
{
    var products: [Product]?
    
    struct Storyboard {
        static let feedProductCell = "FeedProductCell"
        static let showProductDetail = "ShowProductDetail"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "FEED"
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func fetchProducts()
    {
        products = Product.fetchProducts()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell

        if let products = products {
            let product = products[indexPath.row]
            cell.product = product
            cell.selectionStyle = .none
        }

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    private var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedProduct = products?[indexPath.row]
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Storyboard.showProductDetail {
            if let productDetailTVC = segue.destination as? ProductDetailTVC {
                productDetailTVC.product = selectedProduct
            }
        }
    }
}

















