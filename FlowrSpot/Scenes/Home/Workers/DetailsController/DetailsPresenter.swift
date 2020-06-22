//
//  DetailsPresenter.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation

protocol DetailsPresentationLogic {
    func presentFlowerDetails(_ flower: Flower)
    func presentSightings(_ sightings: [Sighting])
    func presentFlowerDetailError(_ error: RemoteResourceError)
}

class DetailsPresenter {
  weak var viewController: DetailsDisplayLogic?
}

// MARK: - Presentation Logic
extension DetailsPresenter: DetailsPresentationLogic {
    func presentFlowerDetails(_ flower: Flower) {
        viewController?.displayFlower(flower)
    }
  
    func presentFlowerDetailError(_ error: RemoteResourceError) {
        viewController?.displayError(error)
    }
    
    func presentSightings(_ sightings: [Sighting]) {
        
    }
}
