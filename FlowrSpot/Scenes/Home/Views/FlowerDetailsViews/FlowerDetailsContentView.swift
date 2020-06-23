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
    let headerViewHeight: CGFloat = 255
    let headerView = FlowerDetailsHeaderView.autolayoutView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).autolayoutView()
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
    setupHeaderView()
    setupEmptyView()
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.keyboardDismissMode = .onDrag
    collectionView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
    collectionView.register(SightingCell.self)
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
  
  func setupHeaderView() {
    addSubview(headerView)
    headerView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview()
      $0.height.equalTo(headerViewHeight)
    }
  }
  
  func setupEmptyView() {
    addSubview(emptyView)
    emptyView.text = "placeholder_no_content".localized()
    emptyView.snp.makeConstraints {
      $0.top.equalTo(headerView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}
