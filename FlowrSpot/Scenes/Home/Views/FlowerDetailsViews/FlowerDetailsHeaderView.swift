//
//  FlowerDetailsHeaderView.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import UIKit
import SnapKit

class FlowerDetailsHeaderView: UIView {
    private let backgroundImageView = UIImageView.autolayoutView()
    private let titleLabel = UILabel.autolayoutView()
    private let subtitleLabel = UILabel.autolayoutView()
    private let addNewSightingButton = UIButton.autolayoutView()
    
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
    }
    
    func setupBackgroundImageView() {
      addSubview(backgroundImageView)
      backgroundImageView.image = UIImage(named: "flowerPlaceholder")
      backgroundImageView.contentMode = .scaleAspectFill
      backgroundImageView.snp.makeConstraints {
        $0.top.left.right.bottom.equalToSuperview()
      }
    }
    
    func setupTitleLabel() {
      addSubview(titleLabel)
      titleLabel.font = .custom(type: .regular, size: 24)
      titleLabel.textColor = .white
      titleLabel.textAlignment = .center
      titleLabel.numberOfLines = 0
      titleLabel.text = "home_title".localized()
      titleLabel.snp.makeConstraints {
        $0.top.equalTo(60)
        $0.left.equalTo(20)
        $0.right.equalTo(-20)
      }
    }
    
    func setupSubtitleLabel() {
      addSubview(subtitleLabel)
      subtitleLabel.font = .custom(type: .light, size: 12)
      subtitleLabel.textAlignment = .center
      subtitleLabel.numberOfLines = 0
      subtitleLabel.alpha = 0.7
      subtitleLabel.textColor = .white
      subtitleLabel.text = "home_subtitle".localized()
      subtitleLabel.snp.makeConstraints {
        $0.left.equalTo(20)
        $0.right.equalTo(-20)
        $0.centerX.equalToSuperview()
        $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      }
    }
}
