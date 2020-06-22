//
//  DetailsCollectionViewItemDimension.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import UIKit

struct DetailsCollectionViewItemDimension: CollectionViewItemDimension {
    let numberOfItemsInRow: Int
    let insets: CGFloat
    let defaultWidth: CGFloat = 85
    let defaultHeight: CGFloat = 100
     
     init(numberOfItemsInRow: Int, insets: CGFloat) {
       self.numberOfItemsInRow = numberOfItemsInRow
       self.insets = insets
     }
}

extension DetailsCollectionViewItemDimension {
  var sectionInset: UIEdgeInsets {
    return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
  }
  
  var lineSpacing: CGFloat {
    return insets
  }
  
  var interItemSpacing: CGFloat {
    return insets
  }
  
  func sizeForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize {
    let aspect = defaultHeight / defaultWidth
    
    let leftAndRightInset = insets * 2
    let spacing = interItemSpacing * CGFloat(numberOfItemsInRow - 1)
    let itemWidth = (collectionView.bounds.width - leftAndRightInset - spacing) / CGFloat(numberOfItemsInRow)
    
    return CGSize(width: floor(itemWidth), height: floor(itemWidth * aspect))
  }
}
