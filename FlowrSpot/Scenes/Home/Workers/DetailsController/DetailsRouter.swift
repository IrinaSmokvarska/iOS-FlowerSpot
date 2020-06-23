//
//  DetailsRouter.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import UIKit

protocol DetailsRoutingLogic {
    func navigateToSightingDetails(sighting: Sighting)
    func navigateToAlert(title: String, message: String, handler: (() -> Void)?)
}

protocol DetailsRouterDelegate: class {
    
}

class DetailsRouter {
    weak var viewController: DetailsViewController?
    weak var delegate: DetailsRouterDelegate?
}

// MARK: - Routing Logic
extension DetailsRouter: DetailsRoutingLogic {
    func navigateToSightingDetails(sighting: Sighting) {
        
    }
    
    func navigateToAlert(title: String, message: String, handler: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel, handler: { _ in handler?() }))
        viewController?.present(alert, animated: true, completion: nil)
  }
}
