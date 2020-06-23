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

class FlowerDetailsHeaderView: UICollectionReusableView {
    private let backgroundImageView = UIImageView.autolayoutView()
    private let sightingsIcon = UIImageView.autolayoutView()
    private let sightingsIconView = UIView.autolayoutView()
    private let titleLabel = UILabel.autolayoutView()
    private let subtitleLabel = UILabel.autolayoutView()
    private let addNewSightingButton = UIButton.autolayoutView()
    private let sightingsHolderView = UIView.autolayoutView()
    private let sightingsLabel = UILabel.autolayoutView()
    private let featuresLabel = UILabel.autolayoutView()
    private let descriptionLabel = UILabel.autolayoutView()
    
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
        setupSightingButton()
        setupSubtitleLabel()
        setupTitleLabel()
        setupSightingsIconView()
        setupSightingsIcon()
        setupSightingsView()
        setupSightingsLabel()
        setupFeaturesLabel()
        setupDescriptionLabel()
    }
    
    func setupBackgroundImageView() {
      addSubview(backgroundImageView)
      backgroundImageView.contentMode = .scaleToFill
      backgroundImageView.snp.makeConstraints {
        $0.left.right.top.equalToSuperview()
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
        $0.left.equalTo(subtitleLabel.snp.left)
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
        $0.bottom.equalTo(addNewSightingButton.snp.top).offset(-43)
      }
    }
    
    func setupSightingButton() {
        addSubview(addNewSightingButton)
        addNewSightingButton.setImage(UIImage(named: "iconAddSighting"), for: .normal)
        addNewSightingButton.layer.cornerRadius = 3.0
        addNewSightingButton.clipsToBounds = true
        
        backgroundImageView.bringSubviewToFront(addNewSightingButton)
        addNewSightingButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(23)
            make.width.equalTo(188)
            make.height.equalTo(48)
            make.centerY.equalTo(backgroundImageView.snp.bottom)
        }
    }
    
    func setupSightingsIconView() {
        addSubview(sightingsIconView)
        sightingsIconView.backgroundColor = .white
        sightingsIconView.layer.cornerRadius = 15
        sightingsIconView.clipsToBounds = true
        
        sightingsIconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(23)
            make.width.height.equalTo(30)
            make.bottom.equalTo(titleLabel.snp.top).offset(-15)
        }
    }
    func setupSightingsIcon() {
        sightingsIconView.addSubview(sightingsIcon)
        sightingsIcon.image = UIImage(named: "iconCircleFavs")
        sightingsIcon.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(13)
            make.height.equalTo(12)
        }
    }
    
    func setupSightingsView() {
        addSubview(sightingsHolderView)
        sightingsHolderView.backgroundColor = .black
        sightingsHolderView.alpha = 0.4
        sightingsHolderView.layer.cornerRadius = 16
        sightingsHolderView.clipsToBounds = true
        
        sightingsHolderView.snp.makeConstraints { (make) in
            make.left.equalTo(sightingsIconView.snp.right).offset(10)
            make.width.equalTo(103)
            make.height.equalTo(30)
            make.centerY.equalTo(sightingsIcon)
        }
    }
    
    func setupSightingsLabel() {
        addSubview(sightingsLabel)
        sightingsLabel.font = .custom(type: .regular, size: 12)
        sightingsLabel.textColor = .white
        sightingsLabel.textAlignment = .center
        
        sightingsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sightingsHolderView.snp.left).offset(15)
            make.right.equalTo(sightingsHolderView.snp.right).offset(-15)
            make.top.equalTo(sightingsHolderView.snp.top).offset(9)
            make.bottom.equalTo(sightingsHolderView.snp.bottom).offset(-8)
        }
    }
    
    func setupFeaturesLabel() {
        addSubview(featuresLabel)
        featuresLabel.font = .custom(type: .bold, size: 13)
        featuresLabel.textColor = UIColor.sightingLightGray
        featuresLabel.numberOfLines = 0
        
        featuresLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(23)
            make.top.equalTo(addNewSightingButton.snp.bottom).offset(34)
            make.right.lessThanOrEqualToSuperview().offset(-23)
        }
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.font = .custom(type: .regular, size: 13)
        descriptionLabel.textColor = UIColor.sightingLightGray
        descriptionLabel.numberOfLines = 0
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(23)
            make.top.equalTo(featuresLabel.snp.bottom).offset(34)
            make.right.equalToSuperview().offset(-23)
            make.bottom.equalToSuperview().offset(-36)
        }
    }
}

// MARK: - DetailsDisplayLogic
extension FlowerDetailsHeaderView: DetailsDisplayLogic {
    func displayFlower(_ flower: Flower) {
        backgroundImageView.kf.setImage(with: URL(string: "http:\(flower.profilePicture)"))
        titleLabel.text = flower.name
        subtitleLabel.text = flower.latinName
        sightingsLabel.text = "sightings_count".localized(flower.sightings)
        featuresLabel.text = flower.features?.joined(separator: "\n\n")
        descriptionLabel.text = flower.description ?? ""
    }
}
