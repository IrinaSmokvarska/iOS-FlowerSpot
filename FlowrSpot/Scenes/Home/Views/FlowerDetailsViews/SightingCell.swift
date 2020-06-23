//
//  SightingCell.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import PovioKit
import Kingfisher
import MapKit

class SightingCell: UICollectionViewCell {
    private let imageView = UIImageView.autolayoutView()
    private let profilePictureImageView = UIImageView.autolayoutView()
    private let locationButton = UIButton.autolayoutView()
    private let nameLabel = UILabel.autolayoutView()
    private let userLabel = UILabel.autolayoutView()
    private let descriptionLabel = UILabel.autolayoutView()
    private let favoritesLabel = UILabel.autolayoutView()
    private let favoritesImageView = UIImageView.autolayoutView()
    private let favoritesView = UIView.autolayoutView()
    private let commentsLabel = UILabel.autolayoutView()
    private let commentsImageView = UIImageView.autolayoutView()
    private let commentsView = UIView.autolayoutView()
    private let holderViewFlowerInfo = UIView.autolayoutView()
    private let nameUserHolderView = UIView.autolayoutView()
    private let separatorView = UIView.autolayoutView()
    private let locationView = UIView.autolayoutView()
    private let locationImageView = UIImageView.autolayoutView()
    private let locationLabel = UILabel.autolayoutView()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension SightingCell {
    private func setupNameLabel(sighting: Sighting) {
        nameLabel.text = sighting.name
        nameLabel.font = .custom(type: .regular, size: 15)
        nameLabel.textColor = UIColor.sightingDarkGray
    }
    
    private func setupUserNameLabel(sighting: Sighting) {
        userLabel.text = sighting.user.fullName
        userLabel.font = .custom(type: .italic, size: 12)
        userLabel.textColor = UIColor.sightingLightGray
    }
    
    private func setupDescriptionLabel(sighting: Sighting) {
        descriptionLabel.text = sighting.description
        descriptionLabel.font = .custom(type: .regular, size: 13)
        descriptionLabel.textColor = UIColor.sightingLightGray
    }
    
    private func setupFavoritesLabel(sighting: Sighting) {
        favoritesLabel.text = "favorites_count".localized(sighting.likesCount)
        favoritesLabel.font = .custom(type: .regular, size: 12)
        favoritesLabel.textColor = UIColor.sightingLightGray
    }
    
    private func setupCommentsLabel(sighting: Sighting) {
        commentsLabel.text = "comments_count".localized(sighting.commentsCount)
        commentsLabel.font = .custom(type: .regular, size: 12)
        commentsLabel.textColor = UIColor.sightingLightGray
    }
    
    private func setupLocation(sighting: Sighting) {
        locationView.backgroundColor = .white
        locationView.layer.masksToBounds = true
        locationView.layer.cornerRadius = 12
        locationView.layer.shadowOpacity = 1
        locationView.layer.shadowRadius = 30
        locationView.layer.shadowOffset = CGSize(width: 0, height: 15)
        locationView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        
        locationLabel.textColor = UIColor.locationOrange
        locationLabel.font = .custom(type: .regular, size: 12)
        let location = CLLocation(latitude: sighting.latitude, longitude: sighting.longitude)
        location.fetchCityAndCountry { [weak self] city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self?.locationLabel.text = city + ", " + country
        }
        
        locationImageView.image = UIImage(named: "iconLocation")
    }
    
    func setSighting(_ sighting: Sighting) {
        profilePictureImageView.layer.masksToBounds = true
        profilePictureImageView.layer.cornerRadius = 20
        commentsImageView.image = UIImage(named: "iconChat")
        favoritesImageView.image = UIImage(named: "iconFavorites")
        setupNameLabel(sighting: sighting)
        setupUserNameLabel(sighting: sighting)
        setupDescriptionLabel(sighting: sighting)
        setupFavoritesLabel(sighting: sighting)
        setupCommentsLabel(sighting: sighting)
        setupLocation(sighting: sighting)
        
        imageView.kf.setImage(with: URL(string: "http:\(sighting.picture)"))
        profilePictureImageView.kf.setImage(with: URL(string: "http:\(sighting.flower.profilePicture)"))
        separatorView.backgroundColor = UIColor.separatorGrayColor
    }
}

// MARK: - Private methods
private extension SightingCell {
  func setupViews() {
    setupImageView()
    setupHolderView()
    setupProfilePicture()
    setupFlowerAndUserName()
    setupDescription()
    setupSeparatorView()
    setupCommentsView()
    setupFavoritesView()
    setupLocationView()
  }
    func setupImageView() {
        addSubview(imageView)
        imageView.kf.indicatorType = .activity
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(246.83)
            make.left.right.top.equalToSuperview()
        }
    }
    
    func setupLocationView() {
        addSubview(locationView)
        locationView.addSubview(locationImageView)
        locationView.addSubview(locationLabel)
        locationView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.width.equalTo(136)
            make.height.equalTo(25)
        }
        
        locationImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(10)
            make.height.equalTo(13)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.left.equalTo(locationImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupHolderView() {
        addSubview(holderViewFlowerInfo)
        holderViewFlowerInfo.addSubview(profilePictureImageView)
        holderViewFlowerInfo.addSubview(descriptionLabel)
        holderViewFlowerInfo.addSubview(nameUserHolderView)
        holderViewFlowerInfo.addSubview(separatorView)
        holderViewFlowerInfo.addSubview(commentsView)
        holderViewFlowerInfo.addSubview(favoritesView)
        commentsView.addSubview(commentsImageView)
        commentsView.addSubview(commentsLabel)
        favoritesView.addSubview(favoritesImageView)
        favoritesView.addSubview(favoritesLabel)
        nameUserHolderView.addSubview(nameLabel)
        nameUserHolderView.addSubview(userLabel)
        
        holderViewFlowerInfo.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(imageView)
        }
    }
    
    func setupProfilePicture() {
        profilePictureImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(imageView.snp.bottom).offset(24.17)
            make.width.height.equalTo(40)
        }
    }
    
    func setupFlowerAndUserName() {
        nameUserHolderView.snp.makeConstraints { (make) in
            make.left.equalTo(profilePictureImageView.snp.right).offset(40.45)
            make.height.equalTo(35)
            make.top.equalTo(imageView.snp.bottom).offset(28.17)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(16)
        }

        userLabel.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    func setupDescription() {
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(26.79)
            make.top.equalTo(profilePictureImageView.snp.bottom).offset(20)
        }
    }
    
    func setupSeparatorView() {
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(26.79)
            make.right.equalToSuperview().offset(-26.79)
            make.height.equalTo(1)
        }
    }
    
    func setupCommentsView() {
        commentsView.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(separatorView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        commentsImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        commentsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(commentsImageView.snp.right).offset(25.61)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupFavoritesView() {
        favoritesView.snp.makeConstraints { (make) in
            make.centerY.equalTo(commentsView)
            make.left.equalTo(commentsView.snp.right)
        }
        
        favoritesImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        favoritesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(favoritesImageView.snp.right).offset(25.61)
            make.centerY.equalToSuperview()
        }
    }
}
