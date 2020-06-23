//
//  FlowerDetailsHeaderView.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class FlowerDetailsHeaderView: UIView {
    private let backgroundImageView = UIImageView.autolayoutView()
    private let sightingsIcon = UIImageView.autolayoutView()
    private let titleLabel = UILabel.autolayoutView()
    private let subtitleLabel = UILabel.autolayoutView()
    private let addNewSightingButton = UIButton.autolayoutView()
    private let sightingsHolderView = UIView.autolayoutView()
    private let sightingsLabel = UILabel.autolayoutView()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension FlowerDetailsHeaderView {
    func setupViews() {
        clipsToBounds = true
        setupBackgroundImageView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupSightingButton()
    }
    
    func setupBackgroundImageView() {
      addSubview(backgroundImageView)
      backgroundImageView.image = UIImage(named: "flowerPlaceholder")
      backgroundImageView.contentMode = .scaleAspectFill
      backgroundImageView.snp.makeConstraints {
        $0.left.right.equalToSuperview()
        $0.height.equalTo(351)
      }
    }
    
    func setupTitleLabel() {
      addSubview(titleLabel)
      titleLabel.font = .custom(type: .light, size: 35)
      titleLabel.textColor = .white
      titleLabel.textAlignment = .left
      titleLabel.numberOfLines = 0
      titleLabel.snp.makeConstraints {
        $0.left.equalToSuperview().offset(23)
        $0.right.lessThanOrEqualToSuperview().offset(-23)
        $0.bottom.equalTo(subtitleLabel.snp.top).offset(-15)
      }
    }
    
    func setupSubtitleLabel() {
      addSubview(subtitleLabel)
      subtitleLabel.font = .custom(type: .light, size: 14)
      subtitleLabel.textAlignment = .left
      subtitleLabel.numberOfLines = 0
      subtitleLabel.alpha = 0.7
      subtitleLabel.textColor = .white
      subtitleLabel.snp.makeConstraints {
        $0.left.equalToSuperview().offset(23)
        $0.right.lessThanOrEqualToSuperview().offset(-23)
        $0.bottom.equalTo(addNewSightingButton.snp.top).offset(43)
      }
    }
    
    func setupSightingButton() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
          UIColor(red: 0.925, green: 0.737, blue: 0.702, alpha: 1).cgColor,
          UIColor(red: 0.918, green: 0.655, blue: 0.62, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        
        addNewSightingButton.layer.addSublayer(gradientLayer)
        addNewSightingButton.setImage(UIImage(named: "iconAddSighting"), for: .normal)
        addNewSightingButton.layer.cornerRadius = 3.0
        addNewSightingButton.clipsToBounds = true
        
        addNewSightingButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(23)
            make.width.equalTo(188)
            make.height.equalTo(48)
            make.centerY.equalTo(backgroundImageView.snp.bottom)
        }
    }
    
    func setupSightingsIcon() {
        sightingsIcon.image = UIImage(named: "iconCircleFavs")
    }
}

//MARK: - DetailsDisplayLogic
extension FlowerDetailsHeaderView: DetailsDisplayLogic {
    func displayFlower(_ flower: Flower) {
        backgroundImageView.kf.setImage(with: URL(string: "http:\(flower.profilePicture)"))
        titleLabel.text = flower.name
        subtitleLabel.text = flower.latinName
    }
}
