//
//  FlowerDetailsContentView.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import UIKit

class FlowerDetailsContentView: UIView {
    let collectionViewDimensions = DetailsCollectionViewItemDimension(numberOfItemsInRow: 1, insets: 0)
    var headerViewMinHeight: CGFloat = 370
    let headerView = FlowerDetailsHeaderView.autolayoutView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).autolayoutView()
    let scrollView = UIScrollView().autolayoutView()
    let rightBarButton = UIButton(type: .custom)
    let leftBarButton = UIButton(type: .custom)
    let emptyView = EmptyView.autolayoutView()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}

private extension FlowerDetailsContentView {
    func setupViews() {
        backgroundColor = .white
        setupCollectionView()
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.keyboardDismissMode = .onDrag
        collectionView.register(SightingCell.self)
        collectionView.registerSupplementaryView(FlowerDetailsHeaderView.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.bounces = false
        collectionView.alwaysBounceVertical = false
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
          flowLayout.scrollDirection = .vertical
          flowLayout.sectionInset = collectionViewDimensions.sectionInset
          flowLayout.minimumLineSpacing = collectionViewDimensions.lineSpacing
          flowLayout.minimumInteritemSpacing = collectionViewDimensions.interItemSpacing
        }
        collectionView.snp.makeConstraints {
          $0.edges.equalToSuperview()
        }
    }
}

