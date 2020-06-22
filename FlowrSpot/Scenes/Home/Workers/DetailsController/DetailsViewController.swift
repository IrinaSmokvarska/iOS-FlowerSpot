//
//  DetailsViewController.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import PovioKit
import SnapKit

protocol DetailsDisplayLogic: class {
    func displayFlower(_ flower: Flower)
    func displaySightings(_ sightings: [Sighting])
    func displayError(_ error: RemoteResourceError)
}

class DetailsViewController: UIViewController {
    var interactor: DetailsBusinessLogic?
    var router: DetailsRoutingLogic?
    private lazy var contentView = FlowerDetailsContentView.autolayoutView()
  //  private let flowerDataSource = FlowersDataSource()
   // let flowerId: Int?
    
    init(delegate: DetailsRouterDelegate?) {
        super.init(nibName: nil, bundle: nil)
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        interactor.presenter = presenter
        presenter.viewController = self 
        router.viewController = self
        router.delegate = delegate
        self.interactor = interactor
        self.router = router
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      loadData()
    }
}

// MARK: - Display Logic
extension DetailsViewController: DetailsDisplayLogic {
    func displayFlower(_ flower: Flower) {
        print("")
    }
    
    func displayError(_ error: RemoteResourceError) {
        router?.navigateToAlert(title: "general_error".localized(), message: error.localizedDescription, handler: nil)
        contentView.emptyView.isHidden = false
    }
    
    func displaySightings(_ sightings: [Sighting]) {
        
    }
}

// MARK: - UIScrollView Delegate
extension DetailsViewController: UIScrollViewDelegate {

}

// MARK: - Private methods
private extension DetailsViewController {
  func setupViews() {
    navigationItem.titleView = UIImageView(image: UIImage(named: "iconLogo"))
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.rightBarButton)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.leftBarButton)
    setupContentView()
  }

  func setupContentView() {
    view.addSubview(contentView)
    contentView.snp.makeConstraints { $0.edges.equalToSuperview() }
    contentView.rightBarButton.setImage(UIImage(named: "iconDots"), for: .normal)
    contentView.leftBarButton.setImage(UIImage(named: "iconBack"), for: .normal)
    
    contentView.leftBarButton.addTarget(self, action: #selector(leftBarButtonPressed), for: .touchUpInside)
   // contentView.collectionView.delegate = self
  //  contentView.collectionView.dataSource = flowersDataSource
  }
  
  func loadData() {
    interactor?.fetchFlowerDetails(flowerId: 10)
    interactor?.fetchSightings(flowerId: 2)
  }
  
  @objc func leftBarButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
}
