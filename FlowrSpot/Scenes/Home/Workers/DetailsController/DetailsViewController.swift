//
//  DetailsViewController.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import PovioKit

protocol DetailsDisplayLogic: class {
  func displayFlower(_ flower: Flower)
  func displayError(_ error: RemoteResourceError)
}

class DetailsViewController: UIViewController {
    var interactor: DetailsBusinessLogic?
    var router: DetailsRoutingLogic?
  //  private lazy var contentView = HomeContentView.autolayoutView()
  //  private let flowerDataSource = FlowersDataSource()
    
    init(delegate: DetailsRouterDelegate?) {
      super.init(nibName: nil, bundle: nil)
      let interactor = DetailsInteractor()
      let presenter = DetailsPresenter()
      let router = DetailsRouter()
      interactor.presenter = presenter
        presenter.viewController = self as! DetailsDisplayLogic
      router.viewController = self
      router.delegate = delegate
      self.interactor = interactor
        self.router = router as! DetailsRoutingLogic
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
