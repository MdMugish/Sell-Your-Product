//
//  ShoeImagesHeaderViewController.swift
//  Nike+Research
//
//  Created by Duc Tran on 3/25/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView
{
    @IBOutlet weak var pageControl: UIPageControl!
}

extension ProductImagesHeaderView : ProductImagesPageViewControllerDelegate
{
    func setupPageController(numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
}











