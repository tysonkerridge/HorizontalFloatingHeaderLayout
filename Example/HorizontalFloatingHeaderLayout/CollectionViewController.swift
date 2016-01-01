//
//  CollectionViewController.swift
//  HorizontalFloatingHeaderLayout
//
//  Created by Diego Alberto Cruz Castillo on 12/31/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import HorizontalFloatingHeaderLayout

class CollectionViewController: UICollectionViewController,HorizontalFloatingHeaderLayoutDelegate {

    //MARK: - Configure methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        func configureHeaderCell(){
            let headerNib = UINib(nibName: "HeaderView",bundle: nil)
            collectionView?.registerNib(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        }
        
        //
        configureHeaderCell()
    }

    // MARK: - UICollectionView methods
    //MARK: Datasource
    //Number of Sections
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 6
    }

    //Number of Items
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 34
    }

    //Cells
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ItemCell
        cell.configure(title: "\(indexPath.row)")
        return cell
    }
    
    //Headers
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerView", forIndexPath: indexPath)
        return header
    }

    //MARK: Delegate (HorizontalFloatingHeaderDelegate)
    //Item Size
    func collectionView(collectionView: UICollectionView, horizontalFloatingHeaderItemSizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(60, 60)
    }
    
    //Header Size
    func collectionView(collectionView: UICollectionView, horizontalFloatingHeaderSizeForSectionAtIndex section: Int) -> CGSize {
        return CGSizeMake(120, 44)
    }
    
    //Item Spacing
    func collectionView(collectionView: UICollectionView, horizontalFloatingHeaderItemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8.0
    }
    
    //Line Spacing
    func collectionView(collectionView: UICollectionView, horizontalFloatingHeaderLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8.0
    }
    
    //Section Insets
    func collectionView(collectionView: UICollectionView, horizontalFloatingHeaderSectionInsetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(8, 4, 8, 4)
    }
}
