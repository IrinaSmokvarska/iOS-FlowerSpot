//
//  DetailsInteractor.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation

protocol DetailsBusinessLogic {
    func fetchFlowerDetails(flowerId: Int)
    func fetchSightings(flowerId: Int)
}

class DetailsInteractor {
    var presenter: DetailsPresentationLogic?
    var getFlowerDetailsWorker = GetFlowerDetailsWorker()
    var getSightingsWorker = GetSightingsWorker()
}
    
// MARK: - Business Logic
extension DetailsInteractor: DetailsBusinessLogic {
    func fetchFlowerDetails(flowerId: Int) {
        getFlowerDetailsWorker.execute(flowerId: flowerId, success: { (flowerDetails) in
            self.presenter?.presentFlowerDetails(flowerDetails.flower)
        }, failure: { error in
            self.presenter?.presentFlowerDetailError(error)
        })
    }
    
    func fetchSightings(flowerId: Int) {
        getSightingsWorker.execute(flowerId: flowerId, success: { (sightings) in
            self.presenter?.presentSightings(sightings)
        }, failure: { error in
            self.presenter?.presentFlowerDetailError(error)
        })
    }
}
