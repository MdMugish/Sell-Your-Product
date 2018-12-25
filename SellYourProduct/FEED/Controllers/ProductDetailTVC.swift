//
//  ProductDetailTVC.swift
//  Nike-Retail
//
//  Created by Duc Tran on 5/2/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ProductDetailTVC: UITableViewController
{
    @IBOutlet weak var productImagesHeaderView: ProductImagesHeaderView!
    var product: Product!
    
    struct Storyboard {
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let suggestionCell = "SuggestionTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = product.name
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - UITableViewDataSource
    
    // indexPath.row
    // 0 - productDetailCell
    // 1 - buyButtonCell
    // 2 - showProductDetail
    // 3 - you might also like this cell

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.showProductDetailCell, for: indexPath)
             cell.selectionStyle = .none
            
            return cell
            
        } else {
            // product suggestions
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            // TODO: - set product suggestions data here.
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 3 {
            return tableView.bounds.width + 68
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3 {
            if let cell = cell as? SuggestionTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC {
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.images = product.images
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProductDetailTVC : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCollectionViewCell", for: indexPath) as! SuggestionCollectionViewCell
        // TODO: - set real data for product suggestions
        let products = Product.fetchProducts()
        cell.image = products[indexPath.item].images?.first
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ProductDetailTVC : UICollectionViewDelegate
{
    
}

extension ProductDetailTVC : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 5.0
            layout.minimumLineSpacing = 2.5
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        return CGSize.zero
    }
}















