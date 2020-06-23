//
//  FlowerDetailsDataSource.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import PovioKit

class FlowerDetailsDataSource: NSObject, DataSource {
    var sections = [SightingsSection]()
    private var sightings = [Sighting]()
    private var flower: Flower?
    
    func update(sightings: [Sighting]) {
        self.sightings = sightings
        buildSections()
    }
    
    func update(flowerDetails: Flower) {
        self.flower = flowerDetails
    }
}

// MARK: - UICollectionView DataSource
extension FlowerDetailsDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let row = row(at: indexPath) else {
          Logger.error("No availible row in dataSource at \(indexPath)")
          return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(SightingCell.self, at: indexPath)
        switch row {
        case let .sighting(entity):
          cell.setSighting(entity)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FlowerDetailsHeaderView", for: indexPath) as? FlowerDetailsHeaderView else {
                return UICollectionReusableView()
            }
            headerView.backgroundColor = .white
            if let flower = self.flower {
                headerView.displayFlower(flower)
            }
            
            return headerView
        default:
            break
        }
      
        return UICollectionReusableView()
    }
}

// MARK: - Private Methods
private extension FlowerDetailsDataSource {
  func buildSections() {
    let rows = sightings.map(SightingsRow.sighting)
    sections = [SightingsSection(rows: rows)]
  }
}
