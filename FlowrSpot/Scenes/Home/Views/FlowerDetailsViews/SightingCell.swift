//
//  SightingCell.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import PovioKit
import Kingfisher

class SightingCell: UICollectionViewCell {
    private let imageView = UIImageView.autolayoutView()
    private let profilePictureImageView = UIImageView.autolayoutView()
    private let locationButton = UIButton.autolayoutView()
    private let nameLabel = UILabel.autolayoutView()
    private let userLabel = UILabel.autolayoutView()
    private let descriptionLabel = UILabel.autolayoutView()
    private let likesLabel = UILabel.autolayoutView()
    private let likesView = UIImageView.autolayoutView()
    private let commentsLabel = UILabel.autolayoutView()
    private let commentsView = UIImageView.autolayoutView()
    private let holderViewFlowerInfo = UIView.autolayoutView()
    private let nameUserHolderView = UIView.autolayoutView()
    private let separatorView = UIView.autolayoutView()
    
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
  func setSighting(_ sighting: Sighting) {
    nameLabel.text = sighting.name
    nameLabel.font = .custom(type: .regular, size: 15)
    nameLabel.textColor = UIColor.sightingDarkGray
    
    userLabel.text = sighting.user.fullName
    userLabel.font = .custom(type: .italic, size: 12)
    userLabel.textColor = UIColor.sightingLightGray
    
    descriptionLabel.text = sighting.description
    descriptionLabel.font = .custom(type: .regular, size: 13)
    descriptionLabel.textColor = UIColor.sightingLightGray
    
    likesLabel.text = "favorites_count".localized(sighting.likesCount)
    commentsLabel.text = "comments_count".localized(sighting.commentsCount)
   // sightingsLabel.text = "sightings_count".localized(flower.sightings)
    imageView.kf.setImage(with: URL(string: "http:\(sighting.picture)"))
    profilePictureImageView.kf.setImage(with: URL(string: "http:\(sighting.flower.profilePicture)"))
    
    separatorView.backgroundColor = UIColor.separatorGrayColor
  }
}

// MARK: - Private methods
private extension SightingCell {
  func setupViews() {
    profilePictureImageView.layer.masksToBounds = true
    profilePictureImageView.layer.cornerRadius = 20
    setupImageView()
    setupHolderView()
    setupProfilePicture()
    setupFlowerAndUserName()
    setupDescription()
  }
    func setupImageView() {
        addSubview(imageView)
        imageView.kf.indicatorType = .activity
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(246.83)
            make.left.right.top.equalToSuperview()
        }
    }
    
    func setupHolderView() {
        addSubview(holderViewFlowerInfo)
        holderViewFlowerInfo.addSubview(profilePictureImageView)
        holderViewFlowerInfo.addSubview(descriptionLabel)
        holderViewFlowerInfo.addSubview(nameUserHolderView)
        holderViewFlowerInfo.addSubview(separatorView)
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
            make.left.right.equalToSuperview().offset(26.79)
        }
    }
//  func setupFavoriteButton() {
//    addSubview(favoriteButton)
//    favoriteButton.backgroundColor = .white
//    favoriteButton.layer.cornerRadius = 12
//    favoriteButton.setImage(#imageLiteral(resourceName: "favoritesIcons"), for: .normal)
//    favoriteButton.snp.makeConstraints {
//      $0.top.equalTo(12)
//      $0.trailing.equalTo(-12)
//      $0.size.equalTo(24)
//    }
//  }
//
//  func setupSightingsLabel() {
//    addSubview(sightingsLabel)
//    sightingsLabel.font = .custom(type: .regular, size: 10)
//    sightingsLabel.textColor = .white
//    sightingsLabel.textAlignment = .center
//    sightingsLabel.snp.makeConstraints {
//      $0.bottom.equalTo(-30)
//      $0.height.equalTo(24)
//      $0.centerX.equalToSuperview()
//    }
//  }
//
//  func setupLabelWrapperView() {
//    addSubview(sightingsLabelWrapperView)
//    sightingsLabelWrapperView.backgroundColor = .black
//    sightingsLabelWrapperView.alpha = 0.5
//    sightingsLabelWrapperView.layer.cornerRadius = 12
//    sightingsLabelWrapperView.snp.makeConstraints {
//      $0.center.equalTo(sightingsLabel.snp.center)
//      $0.height.equalTo(24)
//      $0.width.equalTo(sightingsLabel.snp.width).offset(25)
//    }
//  }
//
//  func setupSubtitleLabel() {
//    addSubview(subtitleLabel)
//    subtitleLabel.font = .custom(type: .italic, size: 10)
//    subtitleLabel.textColor = .white
//    subtitleLabel.textAlignment = .center
//    subtitleLabel.alpha = 0.7
//    subtitleLabel.snp.makeConstraints {
//      $0.leading.equalTo(20)
//      $0.trailing.equalTo(-20)
//      $0.bottom.equalTo(sightingsLabelWrapperView.snp.top).offset(-20)
//      $0.centerX.equalToSuperview()
//    }
//  }
//
//  func setupTitleLabel() {
//    addSubview(titleLabel)
//    titleLabel.font = .custom(type: .regular, size: 20)
//    titleLabel.textColor = .white
//    titleLabel.textAlignment = .center
//    titleLabel.numberOfLines = 2
//    titleLabel.snp.makeConstraints {
//      $0.leading.equalTo(12)
//      $0.trailing.equalTo(-12)
//      $0.bottom.equalTo(subtitleLabel).inset(15)
//      $0.centerX.equalToSuperview()
//    }
//  }
}
