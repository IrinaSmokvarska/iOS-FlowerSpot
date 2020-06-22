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
}

class DetailsInteractor {
    var presenter: DetailsPresentationLogic?
    var getFlowerDetailsWorker = GetFlowerDetailsWorker()
}
    
// MARK: - Business Logic
extension DetailsInteractor: DetailsBusinessLogic {
    func fetchFlowerDetails(flowerId: Int) {
        getFlowerDetailsWorker.execute(flowerId: flowerId, success: { (flower) in
            self.presenter?.presentFlowerDetails(flower)
        }) { error in
            self.presenter?.presentFlowerDetailError(error)
        }
    }
}
