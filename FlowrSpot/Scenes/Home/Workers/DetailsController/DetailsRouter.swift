//
//  DetailsRouter.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation

protocol DetailsRoutingLogic {
    
}

protocol DetailsRouterDelegate: class {
    
}

class DetailsRouter {
    weak var viewController: DetailsViewController?
    weak var delegate: DetailsRouterDelegate?
}

/*
 protocol HomeRoutingLogic {
   func navigateToFlowerDetails(flower: Flower)
   func navigateToAlert(title: String, message: String, handler: (() -> Void)?)
 }

 protocol HomeRouterDelegate: class {
   
 }

 class HomeRouter {
   weak var viewController: HomeViewController?
   weak var delegate: HomeRouterDelegate?
 }

 // MARK: - Routing Logic
 extension HomeRouter: HomeRoutingLogic {
   func navigateToFlowerDetails(flower: Flower) {
     
     // TODO: - Implement me
   }
   
   func navigateToAlert(title: String, message: String, handler: (() -> Void)?) {
     let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel, handler: { _ in handler?() }))
     viewController?.present(alert, animated: true, completion: nil)
   }
 }

 */
